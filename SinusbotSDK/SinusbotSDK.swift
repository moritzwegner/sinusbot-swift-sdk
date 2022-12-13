//
//  Sinusbot.swift
//  SinusbotSDK
//
//  Created by Moritz Wegner on 24.11.20.
//

import Foundation
import Alamofire

public class SinusbotSDK {
    let host: String
    let username: String
    let password: String
    var defaultBotId: String
    var headers: HTTPHeaders
    
    public init(host: String, username: String, password: String, defaultBotId: String = "") {
        self.host = host
        self.username = username
        self.password = password
        self.defaultBotId = defaultBotId
        
        self.headers = [
            "Accept": "application/json"
        ]
    }
    
    private func fetchDefaultBotId(completion: @escaping (DefaultBot?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/botId")
            .validate()
            .responseDecodable(of: DefaultBot.self) {
                response in guard let defaultBot = response.value else {completion(nil, response.error); return}
                completion(defaultBot, nil)
            }
    }
    
    public func login(completion: @escaping (Bool, Error?) -> Void) {
        self.fetchDefaultBotId {
            (response, error) in guard let defaultBot = response else {completion(false, error); return}
            let loginRequest = LoginRequest(username: self.username, password: self.password, botId: defaultBot.defaultBotId)
            
            AF.request(self.host + "/api/v1/bot/login",
                       method: .post,
                       parameters: loginRequest,
                       encoder: JSONParameterEncoder.default).responseDecodable(of: LoginResponse.self) {
                response in guard let loginResponse = response.value else {completion(false, response.error); return}
                            self.headers.add(name: "Authorization", value: "bearer " + loginResponse.token)
                            completion(true, nil);
                       }
        }
    }
    
    public func getBotInfo(completion: @escaping (BotInfoResponse?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/info",
                   method: .get,
                   headers: self.headers
        ).validate().responseDecodable(of: BotInfoResponse.self) {
            response in guard let botInfo = response.value else {completion(nil, response.error); return}
            completion(botInfo, nil)
        }
    }
    
    public func getBotInstances(completion: @escaping ([BotInstanceResponse]?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/instances",
                   method: .get,
                   headers: self.headers
        ).validate().responseDecodable(of: [BotInstanceResponse].self) {
            response in guard let botInstances = response.value else {completion(nil, response.error); return}
            completion(botInstances, nil)
        }
    }
    
    public func createBotInstance(createBotInstanceRequest: CreateBotInstanceRequest, completion: @escaping (CreateBotInstanceResponse?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/instances",
                   method: .post,
                   parameters: createBotInstanceRequest,
                   encoder: JSONParameterEncoder.default,
                   headers: self.headers
        ).validate().responseDecodable(of: CreateBotInstanceResponse.self) {
            response in guard let createBotInstanceResponse = response.value else {completion(nil, response.error); return}
            completion(createBotInstanceResponse, nil)
        }
    }
    
    public func deleteBotInstance(botInstanceUuid: String, completion: @escaping (Response?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/instances/" + botInstanceUuid,
                   method: .delete,
                   headers: self.headers
        ).validate().responseDecodable(of: Response.self) {
            response in guard let deleteBotInstanceResponse = response.value else {completion(nil, response.error); return}
            completion(deleteBotInstanceResponse, nil)
        }
    }
    
    public func restartBotInstance(botInstanceUuid: String, completion: @escaping (Response?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/i/" + botInstanceUuid + "/respawn",
                   method: .post,
                   headers: self.headers
        ).validate().responseDecodable(of: Response.self) {
            response in guard let restartBotInstanceResponse = response.value else {completion(nil, response.error); return}
            completion(restartBotInstanceResponse, nil)
        }
    }
    
    public func launchBotInstance(botInstanceUuid: String, completion: @escaping (Response?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/i/" + botInstanceUuid + "/spawn",
                   method: .post,
                   headers: self.headers
        ).validate().responseDecodable(of: Response.self) {
            response in guard let launchBotInstanceResponse = response.value else {completion(nil, response.error); return}
            completion(launchBotInstanceResponse, nil)
        }
    }
    
    public func killBotInstance(botInstanceUuid: String, completion: @escaping (Response?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/i/" + botInstanceUuid + "/kill",
                   method: .post,
                   headers: self.headers
        ).validate().responseDecodable(of: Response.self) {
            response in guard let killBotInstanceResponse = response.value else {completion(nil, response.error); return}
            completion(killBotInstanceResponse, nil)
        }
    }
    
    public func editBotInstance(editBotInstanceRequest: EditBotInstanceRequest, completion: @escaping (Response?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/i/" + editBotInstanceRequest.instanceId + "/settings",
                   method: .post,
                   parameters: editBotInstanceRequest,
                   encoder: JSONParameterEncoder.default,
                   headers: self.headers
        ).validate().responseDecodable(of: Response.self) {
            response in guard let editBotInstanceResponse = response.value else {completion(nil, response.error); return}
            completion(editBotInstanceResponse, nil)
        }
    }
    
    public func getBotInstanceStatus(botInstanceUuid: String, completion: @escaping (BotInstanceStatusResponse?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/i/" + botInstanceUuid + "/status",
                   method: .get,
                   headers: self.headers
        ).validate().responseDecodable(of: BotInstanceStatusResponse.self) {
            response in guard let botInstanceStatusResponse = response.value else {completion(nil, response.error); return}
            completion(botInstanceStatusResponse, nil)
        }
    }
    
    public func decreaseVolumeBy5(botInstanceUuid: String, completion: @escaping (Response?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/i/" + botInstanceUuid + "/volume/down",
                   method: .post,
                   headers: self.headers
        ).validate().responseDecodable(of: Response.self) {
            response in guard let decreaseVolumeBy5BotInstanceResponse = response.value else {completion(nil, response.error); return}
            completion(decreaseVolumeBy5BotInstanceResponse, nil)
        }
    }
    
    public func increaseVolumeBy5(botInstanceUuid: String, completion: @escaping (Response?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/i/" + botInstanceUuid + "/volume/up",
                   method: .post,
                   headers: self.headers
        ).validate().responseDecodable(of: Response.self) {
            response in guard let increaseVolumeBy5BotInstanceResponse = response.value else {completion(nil, response.error); return}
            completion(increaseVolumeBy5BotInstanceResponse, nil)
        }
    }
    
    public func muteBotInstance(botInstanceUuid: String, completion: @escaping (Response?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/i/" + botInstanceUuid + "/mute/1",
                   method: .post,
                   headers: self.headers
        ).validate().responseDecodable(of: Response.self) {
            response in guard let muteBotInstanceResponse = response.value else {completion(nil, response.error); return}
            completion(muteBotInstanceResponse, nil)
        }
    }
    
    public func unmuteBotInstance(botInstanceUuid: String, completion: @escaping (Response?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/i/" + botInstanceUuid + "/mute/0",
                   method: .post,
                   headers: self.headers
        ).validate().responseDecodable(of: Response.self) {
            response in guard let unmuteBotInstanceResponse = response.value else {completion(nil, response.error); return}
            completion(unmuteBotInstanceResponse, nil)
        }
    }
    
    public func pauseBotInstancePlayback(botInstanceUuid: String, completion: @escaping (Response?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/i/" + botInstanceUuid + "/pause",
                   method: .post,
                   headers: self.headers
        ).validate().responseDecodable(of: Response.self) {
            response in guard let pauseBotInstanceResponse = response.value else {completion(nil, response.error); return}
            completion(pauseBotInstanceResponse, nil)
        }
    }
    
    public func stopBotInstancePlayback(botInstanceUuid: String, completion: @escaping (Response?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/i/" + botInstanceUuid + "/stop",
                   method: .post,
                   headers: self.headers
        ).validate().responseDecodable(of: Response.self) {
            response in guard let stopBotInstancePlaybackResponse = response.value else {completion(nil, response.error); return}
            completion(stopBotInstancePlaybackResponse, nil)
        }
    }
    
    public func setBotInstanceVolume(botInstanceUuid: String, volumeLevel: Int, completion: @escaping (Response?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/i/" + botInstanceUuid + "/volume/set/" + String(volumeLevel),
                   method: .post,
                   headers: self.headers
        ).validate().responseDecodable(of: Response.self) {
            response in guard let pauseBotInstanceResponse = response.value else {completion(nil, response.error); return}
            completion(pauseBotInstanceResponse, nil)
        }
    }
    
    public func getRecentPlayedTracksForBotInstance(botInstanceUuid: String, completion: @escaping (RecentPlayedTracksResponse?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/i/" + botInstanceUuid + "/recent",
                   method: .get,
                   headers: self.headers
        ).validate().responseDecodable(of: RecentPlayedTracksResponse.self) {
            response in guard let recentPlayedTracks = response.value else {completion(nil, response.error); return}
            completion(recentPlayedTracks, nil)
        }
    }
    
    public func getBotInstanceLogs(botInstanceUuid: String, completion: @escaping (BotInstanceLogResponse?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/i/" + botInstanceUuid + "/log",
                   method: .get,
                   headers: self.headers
        ).validate().responseDecodable(of: BotInstanceLogResponse.self) {
            response in guard let botInstanceLogResponse = response.value else {completion(nil, response.error); return}
            completion(botInstanceLogResponse, nil)
        }
    }
    
    public func getRecentLogs(completion: @escaping (BotInstanceLogResponse?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/log",
                   method: .get,
                   headers: self.headers
        ).validate().responseDecodable(of: BotInstanceLogResponse.self) {
            response in guard let recentLogResponse = response.value else {completion(nil, response.error); return}
            completion(recentLogResponse, nil)
        }
    }
    
    public func getUsers(completion: @escaping (SinusbotUserResponse?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/users",
                   method: .get,
                   headers: self.headers
        ).validate().responseDecodable(of: SinusbotUserResponse.self) {
            response in guard let sinusbotUserResponse = response.value else {completion(nil, response.error); return}
            completion(sinusbotUserResponse, nil)
        }
    }
    
    public func createUser(createSinusbotUserRequest: CreateSinusbotUserRequest, completion: @escaping (Response?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/users",
                   method: .post,
                   parameters: createSinusbotUserRequest,
                   encoder: JSONParameterEncoder.default,
                   headers: self.headers
        ).validate().responseDecodable(of: Response.self) {
            response in guard let createSinusbotUserResponse = response.value else {completion(nil, response.error); return}
            completion(createSinusbotUserResponse, nil)
        }
    }
    
    public func deleteUser(sinusbotUserId: String, completion: @escaping (Response?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/users/" + sinusbotUserId,
                   method: .delete,
                   headers: self.headers
        ).validate().responseDecodable(of: Response.self) {
            response in guard let deleteSinusbotUserResponse = response.value else {completion(nil, response.error); return}
            completion(deleteSinusbotUserResponse, nil)
        }
    }
    
    public func getTeamspeakChannels(botInstanceUuid: String, completion: @escaping ([TeamspeakChannel]?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/i/" + botInstanceUuid + "/channels",
                   method: .get,
                   headers: self.headers
        ).validate().responseDecodable(of: [TeamspeakChannel].self) {
            response in guard let teamspeakChannelResponse = response.value else {completion(nil, response.error); return}
            completion(teamspeakChannelResponse, nil)
        }
    }
    
    public func addUrl(addUrlRequest: AddUrlRequest, completion: @escaping (Response?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/url",
                   method: .post,
                   parameters: addUrlRequest,
                   encoder: JSONParameterEncoder.default,
                   headers: self.headers
        ).validate().responseDecodable(of: Response.self) {
            response in guard let addUrlResponse = response.value else {completion(nil, response.error); return}
            completion(addUrlResponse, nil)
        }
    }
    
    public func addFolder(addFolderRequest: AddFolderRequest, completion: @escaping (Response?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/folders",
                   method: .post,
                   parameters: addFolderRequest,
                   encoder: JSONParameterEncoder.default,
                   headers: self.headers
        ).validate().responseDecodable(of: Response.self) {
            response in guard let addFolderResponse = response.value else {completion(nil, response.error); return}
            completion(addFolderResponse, nil)
        }
    }
    
    public func deleteFile(fileId: String, completion: @escaping (Response?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/files/" + fileId,
                   method: .delete,
                   headers: self.headers
        ).validate().responseDecodable(of: Response.self) {
            response in guard let deleteFileResponse = response.value else {completion(nil, response.error); return}
            completion(deleteFileResponse, nil)
        }
    }
    
    public func getFileList(completion: @escaping (FileListResponse?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/files",
                   method: .get,
                   headers: self.headers
        ).validate().responseDecodable(of: FileListResponse.self) {
            response in guard let fileListResponse = response.value else {completion(nil, response.error); return}
            completion(fileListResponse, nil)
        }
    }
    
    public func updateFileTags(fileId: String, updateFileTagsRequest: UpdateFileTagsRequest, completion: @escaping (Response?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/files/" + fileId,
                   method: .patch,
                   parameters: updateFileTagsRequest,
                   encoder: JSONParameterEncoder.default,
                   headers: self.headers
        ).validate().responseDecodable(of: Response.self) {
            response in guard let updateFileTagsResponse = response.value else {completion(nil, response.error); return}
            completion(updateFileTagsResponse, nil)
        }
    }
    
    public func getUploadRestrictions(completion: @escaping (Response?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/uploadInfo",
                   method: .get,
                   headers: self.headers
        ).validate().responseDecodable(of: Response.self) {
            response in guard let uploadRestrictionsResponse = response.value else {completion(nil, response.error); return}
            completion(uploadRestrictionsResponse, nil)
        }
    }
    
    public func removeAvatar(botInstanceUuid: String, completion: @escaping (Response?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/i/" + botInstanceUuid + "/avatar",
                   method: .delete,
                   headers: self.headers
        ).validate().responseDecodable(of: Response.self) {
            response in guard let removeAvatarResponse = response.value else {completion(nil, response.error); return}
            completion(removeAvatarResponse, nil)
        }
    }
    
    public func addDownloadJob(addDownloadJobRequest: AddDownloadJobRequest, completion: @escaping (AddDownloadJobResponse?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/jobs",
                   method: .post,
                   parameters: addDownloadJobRequest,
                   encoder: JSONParameterEncoder.default,
                   headers: self.headers
        ).validate().responseDecodable(of: AddDownloadJobResponse.self) {
            response in guard let addDownloadJobResponse = response.value else {completion(nil, response.error); return}
            completion(addDownloadJobResponse, nil)
        }
    }
    
    public func cancelDownloadJob(jobId: String, completion: @escaping (Response?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/jobs/" + jobId,
                   method: .delete,
                   headers: self.headers
        ).validate().responseDecodable(of: Response.self) {
            response in guard let cnacelDownloadJobResponse = response.value else {completion(nil, response.error); return}
            completion(cnacelDownloadJobResponse, nil)
        }
    }
    
    public func getDownloadJobList(completion: @escaping ([DownloadJob]?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/jobs",
                   method: .get,
                   headers: self.headers
        ).validate().responseDecodable(of: [DownloadJob].self) {
            response in guard let downloadJobListResponse = response.value else {completion(nil, response.error); return}
            completion(downloadJobListResponse, nil)
        }
    }
    
    public func deleteFinishedJobEntries(completion: @escaping (Response?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/jobs/",
                   method: .delete,
                   headers: self.headers
        ).validate().responseDecodable(of: Response.self) {
            response in guard let deleteFinishedJobEntriesResponse = response.value else {completion(nil, response.error); return}
            completion(deleteFinishedJobEntriesResponse, nil)
        }
    }
    
    public func enablePlaylistRepeat(botInstanceUuid: String, completion: @escaping (Response?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/i/" + botInstanceUuid + "/repeat/1",
                   method: .post,
                   headers: self.headers
        ).validate().responseDecodable(of: Response.self) {
            response in guard let enablePlaylistRepeatResponse = response.value else {completion(nil, response.error); return}
            completion(enablePlaylistRepeatResponse, nil)
        }
    }
    
    public func disablePlaylistRepeat(botInstanceUuid: String, completion: @escaping (Response?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/i/" + botInstanceUuid + "/repeat/0",
                   method: .post,
                   headers: self.headers
        ).validate().responseDecodable(of: Response.self) {
            response in guard let disablePlaylistRepeatResponse = response.value else {completion(nil, response.error); return}
            completion(disablePlaylistRepeatResponse, nil)
        }
    }
    
    public func enablePlaylistShuffle(botInstanceUuid: String, completion: @escaping (Response?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/i/" + botInstanceUuid + "/shuffle/1",
                   method: .post,
                   headers: self.headers
        ).validate().responseDecodable(of: Response.self) {
            response in guard let enablePlaylistShuffleResponse = response.value else {completion(nil, response.error); return}
            completion(enablePlaylistShuffleResponse, nil)
        }
    }
    
    public func disablePlaylistShuffle(botInstanceUuid: String, completion: @escaping (Response?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/i/" + botInstanceUuid + "/shuffle/0",
                   method: .post,
                   headers: self.headers
        ).validate().responseDecodable(of: Response.self) {
            response in guard let disablePlaylistShuffleResponse = response.value else {completion(nil, response.error); return}
            completion(disablePlaylistShuffleResponse, nil)
        }
    }
    
    public func playNextPlaylist(botInstanceUuid: String, completion: @escaping (Response?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/i/" + botInstanceUuid + "/playNext",
                   method: .post,
                   headers: self.headers
        ).validate().responseDecodable(of: Response.self) {
            response in guard let playNextPlaylistResponse = response.value else {completion(nil, response.error); return}
            completion(playNextPlaylistResponse, nil)
        }
    }
    
    public func playPreviousPlaylist(botInstanceUuid: String, completion: @escaping (Response?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/i/" + botInstanceUuid + "/playPrevious",
                   method: .post,
                   headers: self.headers
        ).validate().responseDecodable(of: Response.self) {
            response in guard let playPreviousPlaylistResponse = response.value else {completion(nil, response.error); return}
            completion(playPreviousPlaylistResponse, nil)
        }
    }
    
    public func appendTrackToQueue(botInstanceUuid: String, trackUuid: String, completion: @escaping (Response?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/i/" + botInstanceUuid + "/queue/append/" + trackUuid,
                   method: .post,
                   headers: self.headers
        ).validate().responseDecodable(of: Response.self) {
            response in guard let appendTrackToQueueResponse = response.value else {completion(nil, response.error); return}
            completion(appendTrackToQueueResponse, nil)
        }
    }
    
    public func prependTrackToQueue(botInstanceUuid: String, trackUuid: String, completion: @escaping (Response?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/i/" + botInstanceUuid + "/queue/prepend/" + trackUuid,
                   method: .post,
                   headers: self.headers
        ).validate().responseDecodable(of: Response.self) {
            response in guard let prependTrackToQueueResponse = response.value else {completion(nil, response.error); return}
            completion(prependTrackToQueueResponse, nil)
        }
    }
    
    public func getQueueList(botInstanceUuid: String, completion: @escaping (QueueTrackListResponse?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/i/" + botInstanceUuid + "/queue",
                   method: .get,
                   headers: self.headers
        ).validate().responseDecodable(of: QueueTrackListResponse.self) {
            response in guard let getQueueListResponse = response.value else {completion(nil, response.error); return}
            completion(getQueueListResponse, nil)
        }
    }
    
    public func removeTrackFromQueue(botInstanceUuid: String, queuePosition: Int, completion: @escaping (Response?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/i/" + botInstanceUuid + "/queue/" + String(queuePosition),
                   method: .delete,
                   headers: self.headers
        ).validate().responseDecodable(of: Response.self) {
            response in guard let removeTrackFromQueueResponse = response.value else {completion(nil, response.error); return}
            completion(removeTrackFromQueueResponse, nil)
        }
    }
    
    public func getScriptList(completion: @escaping (ScriptListResponse?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/scripts",
                   method: .get,
                   headers: self.headers
        ).validate().responseDecodable(of: ScriptListResponse.self) {
            response in guard let getScriptListResponse = response.value else {completion(nil, response.error); return}
            completion(getScriptListResponse, nil)
        }
    }
    
    public func getRadioStations(searchString: String? = "", completion: @escaping (RadioStationsResponse?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/stations?q=" + searchString!,
                   method: .get,
                   headers: self.headers
        ).validate().responseDecodable(of: RadioStationsResponse.self) {
            response in guard let getRadioStationsResponse = response.value else {completion(nil, response.error); return}
            completion(getRadioStationsResponse, nil)
        }
    }
    
    public func playbackFile(botInstanceUuid: String, fileUuid: String, completion: @escaping (Response?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/i/" + botInstanceUuid + "/play/byId/" + fileUuid,
                   method: .post,
                   headers: self.headers
        ).validate().responseDecodable(of: Response.self) {
            response in guard let playbackFileResponse = response.value else {completion(nil, response.error); return}
            completion(playbackFileResponse, nil)
        }
    }
    
    public func playbackFileInPlaylist(botInstanceUuid: String, playlistUuid: String, playlistTrackIndex: Int, completion: @escaping (Response?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/i/" + botInstanceUuid + "/play/byList/" + playlistUuid + "/" + String(playlistTrackIndex),
                   method: .post,
                   headers: self.headers
        ).validate().responseDecodable(of: Response.self) {
            response in guard let playbackFileInPlaylistResponse = response.value else {completion(nil, response.error); return}
            completion(playbackFileInPlaylistResponse, nil)
        }
    }
    
    public func playbackSay(botInstanceUuid: String, playbackSayRequest: PlaybackSayRequest, completion: @escaping (Response?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/i/" + botInstanceUuid + "/say",
                   method: .post,
                   parameters: playbackSayRequest,
                   encoder: JSONParameterEncoder.default,
                   headers: self.headers
        ).validate().responseDecodable(of: Response.self) {
            response in guard let playbackSayResponse = response.value else {completion(nil, response.error); return}
            completion(playbackSayResponse, nil)
        }
    }
    
    public func playbackSeek(botInstanceUuid: String, value: Int, completion: @escaping (Response?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/i/" + botInstanceUuid + "/seek/" + String(value),
                   method: .post,
                   headers: self.headers
        ).validate().responseDecodable(of: Response.self) {
            response in guard let playbackSeekResponse = response.value else {completion(nil, response.error); return}
            completion(playbackSeekResponse, nil)
        }
    }
    
    public func updateUser(userUuid: String, updateUserRequest: UpdateUserRequest, completion: @escaping (Response?, Error?) -> Void) {
        AF.request(self.host + "/api/v1/bot/users/" + userUuid,
                   method: .patch,
                   parameters: updateUserRequest,
                   encoder: JSONParameterEncoder.default,
                   headers: self.headers
        ).validate().responseDecodable(of: Response.self) {
            response in guard let updateUserResponse = response.value else {completion(nil, response.error); return}
            completion(updateUserResponse, nil)
        }
    }
}
