# anki-fen-vis

This is an [Anki](https://apps.ankiweb.net/) plugin to place chess boards in cards with [FEN](https://en.wikipedia.org/wiki/Forsyth%E2%80%93Edwards_Notation) notation:

![](./assets/screenshot0.png)

![](./assets/screenshot1.png)

It's tested on Anki version 2.1.54. It's a spiritual successor to:

| name                                                         | date       | ANKI version |
| ------------------------------------------------------------ | ---------- | ------------ |
| FEN chess visualizer 2.1 ([ankiweb](https://ankiweb.net/shared/info/807548099)) | 2019-03-02 | 2.0, 2.1     |
| FEN chess visualizer ([ankiweb](https://ankiweb.net/shared/info/2923601993)) ([github](https://ospalh.github.io/anki-addons/FEN_visualizer.html)) | 2016-11-29 | 2.0          |

AnkiWeb link: [https://ankiweb.net/shared/info/841766736](https://ankiweb.net/shared/info/841766736)

# installation notes

1. Run Anki then access menu `tools` -> `addons` -> `Get Add-ons` and enter 841766736.

2. Restart Anki.

3. Try adding a card with:
   ```
   What moves constitute the Albin countergambit?
   1.d4 d5 2.c4 e5
   
   [fen]rnbqkbnr/ppp2ppp/8/3pp3/2PP4/8/PP2PPPP/RNBQKBNR w KQkq - 0 3[/fen]
   ```

# developer notes

This works by intercepting card text (using the API provided hook `gui_hooks.editor_will_munge_html`), looking for `[FEN]...[/FEN]`. Upon finding it, [python-chess](https://pypi.org/project/chess/) is used to render an SVG which is substituted into the card text.

Package python-chess 1.9.3 is bundled here because there's no way with Anki addons to express dependencies on PyPI packages.

On MacOS, addon is stored to:

`/Users/<username>/Library/Application Support/Anki2/addons21/841766736`

Good documentation:

* https://addon-docs.ankiweb.net/hooks-and-filters.html
* https://addon-docs.ankiweb.net/addon-config.html
* https://addon-docs.ankiweb.net/sharing.html (how to package for distribution)
* https://docs.ankiweb.net/misc.html#debug-console

To make a new version, see Make target `share`. To upload it, log into https://ankiweb.net then click "Decks" then scroll to the bottom and click "My Shared Items", then select Chess FEN Visualizer, then scroll to "Update".
