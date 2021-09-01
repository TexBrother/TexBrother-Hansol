//
//  KakaoFriendsModel.swift
//  BasicExercise
//
//  Created by 노한솔 on 2021/08/25.
//

import Foundation

// MARK: - KakaoFriendsModel

struct KakaoFriendsModel {
  var profileImageName: String
  var profileNameText: String
  var profileMessageText: String
  
  init(profileImageName: String?,
       profileNameText: String?,
       profileMessageText: String?) {
    
    self.profileImageName = profileImageName ?? "freindtabProfileImg"
    self.profileNameText = profileNameText ?? ""
    self.profileMessageText = profileMessageText ?? ""
  }
}
