# mp3duration
get mp3 durattion files
<br/>
### dependence 
mp3info <br/>
| os       | command                        |
| -------- | ------------------------------ |
| linux    | ```apt-get install mp3info```  |
| mac      | ```brew install mp3info```     |
| windows  | ```...```                      |
### example:
run without clone
```bash
bash <(curl -s https://raw.githubusercontent.com/dnettoRaw/mp3duration/main/getDuration.sh) myFavoriteMusic.mp3
```
<br/>for single file
```bash
bash getDuration.sh myFavoriteMusic.mp3
```
for folder
```bash
bash getDuration.sh myFolder/*.mp3
```
<br><br/> 
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
