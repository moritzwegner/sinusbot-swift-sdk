# Sinusbot SDK for Swift
This is a SDK for the Sinusbot written in Swift. Not all API methods are implemented yet, but the important ones are ready to use. A list of all implemented methods, you can find down below.

## Usage
To use this SDK you need to import SinusbotSDK in your Swift code:

```Swift
import SinusbotSDK
```

Next step is to initialize a new SinusbotSDK instance:

```Swift
let sinusbotSDK = SinusbotSDK(host: "HOST", username: "USERNAME", password: "PASSWORD")
```

Replace HOST, USERNAME and PASSWORD with your own values.

Afterwards it's necessary to call 
```Swift
sinusbot.login {
    (loggedIn, error) in if (loggedIn) {
        // do something after successful login
    } else if (error != nil) {
        // do something with the error
    }
}
```
somewhere in your code. Otherwise all other methods won't work

## Implemented API methods
| API Method                                     | Implemented | Tested | SDK Method                              |
|------------------------------------------------|:-----------:|-------:|-----------------------------------------|
| General Information                            |      ✅      |    ✅   | getBotInfo()                            |
| Login                                          |      ✅      |    ✅   | login()                                 |
| Instances -> Create                            |      ✅      |    ✅   | createBotInstance()                     |
| Instances -> Delete                            |      ✅      |    ✅   | deleteBotInstance()                     |
| Instances -> Launch                            |      ✅      |    ❌   | launchBotInstance()                     |
| Instances -> List                              |      ✅      |    ✅   | getBotInstances()                       |
| Instances -> Restart                           |      ✅      |    ❌   | restartBotInstance()                    |
| Instances -> Settings                          |      ✅      |    ❌   | editBotInstance()                       |
| Instances -> Shutdown                          |      ✅      |    ❌   | killBotInstance()                       |
| Instances -> Status                            |      ✅      |    ✅   | getBotInstanceStatus()                  |
| FileList -> Add an URL                         |      ✅      |    ❌   | addUrl()                                |
| FileList -> Create folder                      |      ✅      |    ❌   | addFolder()                             |
| FileList -> Delete File                        |      ✅      |    ❌   | deleteFile()                            |
| FileList -> List                               |      ✅      |    ❌   | getFileList()                           |
| FileList -> Update file (tags)                 |      ✅      |    ❌   | updateFileTags()                                        |
| FileList -> Upload a file                      |      ❌      |    ❌   |                                         |
| FileList -> Upload restrictions                |      ✅      |    ❌   | getUploadRestrictions()                                        |
| Playback -> Decrease volume by 5%              |      ✅      |    ❌   | decreaseVolumeBy5()                     |
| Playback -> Enable/Disable mute                |      ✅      |    ❌   | muteBotInstance() / unmuteBotInstance() |
| Playback -> Increase volume by 5%              |      ✅      |    ❌   | increaseVolumeBy5()                     |
| Playback -> Pause Playback                     |      ✅      |    ❌   | pauseBotInstancePlayback()              |
| Playback -> Playback URL                       |      ❌      |    ❌   |                                         |
| Playback -> Playback a file inside a playlist  |      ✅      |    ❌   | playbackFileInPlaylist()                                        |
| Playback -> Playback a file                    |      ✅      |    ❌   | playbackFile()                                        |
| Playback -> Say (TTS)                          |      ✅      |    ❌   | playbackSay()                                        |
| Playback -> Seek                               |      ✅      |    ❌   | playbackSeek()                                        |
| Playback -> Set the volume                     |      ✅      |    ❌   | setBotInstanceVolume()                  |
| Playback -> Stop Playback                      |      ✅      |    ❌   | stopBotInstancePlayback()               |
| Playback -> Recently played tracks             |      ✅      |    ❌   | getRecentPlayedTracksForBotInstance()   |
| Avatars -> Remove avatar                       |      ✅      |    ❌   | removeAvatar()                                        |
| Avatars -> Upload avatar                       |      ❌      |    ❌   |                                         |
| Logging -> Instance-Log                        |      ✅      |    ✅   | getBotInstanceLogs()                    |
| Logging -> Recent Bot-Log entries              |      ✅      |    ✅   | getRecentLogs()                         |
| Playlists -> Enable/Disable repeat             |      ✅      |    ❌   | enablePlaylistRepeat() / disablePlaylistRepeat()                                        |
| Playlists -> Enable/Disable shuffle            |      ✅      |    ❌   | enablePlaylistShuffle() / disablePlaylistShuffle()                                        |
| Playlists -> Next                              |      ✅      |    ❌   | playNextPlaylist()                                        |
| Playlists -> Previous                          |      ✅      |    ❌   | playPreviousPlaylist()                                        |
| Queue -> Append a track to the queue           |      ✅      |    ❌   | appendTrackToQueue()                                        |
| Queue -> Get list                              |      ✅      |    ❌   | getQueueList()                                        |
| Queue -> Prepend a track to the queue          |      ✅      |    ❌   | prependTrackToQueue()                                        |
| Queue -> Remove from queue                     |      ✅      |    ❌   | removeTrackFromQueue()                                        |
| Radio -> Get radio stations                    |      ✅      |    ❌   | getRadioStations()                                        |
| Scripts -> Get Settings                        |      ❌      |    ❌   |                                         |
| Scripts -> List Scripts                        |      ✅      |    ❌   | getScriptList()                                        |
| Scripts -> Save settings                       |      ❌      |    ❌   |                                         |
| Streaming -> Get a token for the WebStream     |      ❌      |    ❌   |                                         |
| Streaming -> Get audio stream                  |      ❌      |    ❌   |                                         |
| Teamspeak -> Channel list                      |      ✅      |    ✅   | getTeamspeakChannels()                  |
| Upload and Download -> Add job                 |      ✅      |    ❌   | addDownloadJob()                                        |
| Upload and Download -> Cancel job              |      ✅      |    ❌   | cancelDownloadJob()                                        |
| Upload and Download -> List Jobs               |      ✅      |    ❌   | getDownloadJobList()                                        |
| Upload and Download -> Remove finished entries |      ✅      |    ❌   | deleteFinishedJobEntries()                                        |
| Users -> Create                                |      ✅      |    ✅   | createUser()                            |
| Users -> Delete                                |      ✅      |    ❌   | deleteUser()                            |
| Users -> List                                  |      ✅      |    ✅   | getUsers()                              |
| Users -> Update Instance Privileges            |      ❌      |    ❌   |                                         |
| Users -> Update                                |      ✅      |    ❌   | updateUser()                                        |
