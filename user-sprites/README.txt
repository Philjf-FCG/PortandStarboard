Xenon2 sprite importer drop folder

Put custom PNGs here and restart the game.

Option A: direct file names
- player.png
- enemy.png
- bullet.png
- background.png   (or background_tile.png)
- explosion.png

Option B: sprite sheet + manifest
1. Place a sheet image, e.g. sheet.png
2. Create sprite-manifest.json in this folder
3. Define rectangular regions for each key

Manifest schema:
{
  "sheet": "sheet.png",
  "regions": {
    "player": { "x": 0, "y": 0, "w": 56, "h": 56 },
    "enemy": { "x": 56, "y": 0, "w": 48, "h": 48 },
    "bullet": { "x": 104, "y": 0, "w": 12, "h": 24 },
    "background": { "x": 0, "y": 64, "w": 160, "h": 160 },
    "explosion": { "x": 160, "y": 64, "w": 48, "h": 48 }
  }
}

Optional:
- Set environment variable XENON2_SPRITES_PATH to any folder containing the same files.
