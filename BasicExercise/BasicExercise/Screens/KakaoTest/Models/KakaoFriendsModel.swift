//
//  KakaoFriendsModel.swift
//  BasicExercise
//
//  Created by λΈνμ on 2021/08/25.
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
    
    self.profileImageName = profileImageName ?? "friendtabProfileImg"
    self.profileNameText = profileNameText ?? ""
    self.profileMessageText = profileMessageText ?? ""
  }
}
