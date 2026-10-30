// Moves the selected tab one place left/right. Invisible: a key target only.
// `tab.move` wants an absolute index, so a key binding can't do it alone.
import { View, div } from "gpui-kit";
import { nextCommand, run, spaces } from "herdr";

export default class TabMover extends View {
  init(_props, cx) {
    cx.spawn(async (cx) => {
      for (;;) {
        this.move(await nextCommand());
      }
    });
  }

  move(cmd) {
    const step = cmd === "left" ? -1 : cmd === "right" ? 1 : 0;
    if (step === 0) return;
    const space = spaces().find((s) => s.active);
    const tab = space?.tabs.find((t) => t.active);
    if (!tab) return;
    const index = tab.index + step;
    if (index < 1 || index > space.tabs.length) return;
    run("tab.move", { id: tab.id, index });
  }

  render() {
    return div().id("tabmover");
  }
}
