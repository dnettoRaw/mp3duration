# mp3duration
get mp3 durattion files

### example:

for single file
```bash
bash getDuration.sh myFavoriteMusic.mp3
```
for folder
```bash
bash getDuration.sh myFolder/*.mp3
```

### options:
verbose off
```bash
bash getDuration.sh -0 myFavoriteMusic.mp3
```
verbose default 
```bash
bash getDuration.sh -1 myFavoriteMusic.mp3
```
verbose only day:hour:minute:second
```bash
bash getDuration.sh -2 myFavoriteMusic.mp3
```
verbose hard print every music duration and name
```bash
bash getDuration.sh -3 myFavoriteMusic.mp3
```
