//
//  PostCell.swift
//  InstagramUI
//
//  Created by Ivor D. Addo, PhD on 4/3/17.
//  Copyright © 2017 Developers Academy. All rights reserved.
//

import UIKit
import Firebase

class PostCell: UITableViewCell
{

    @IBOutlet weak var postImageView: UIImageView!
    
    @IBOutlet weak var numberOfLikesButton: UIButton!
    
    @IBOutlet weak var postCaptionLabel: UILabel!
    
    @IBOutlet weak var timeAgoLabel: UILabel!

    
    var post: Post!
        {
            didSet
            {
                self.updateUI()
        }
    }
    
   func updateUI()
   {
    self.postImageView.image = post.image
    postCaptionLabel.text = post.caption
    numberOfLikesButton.setTitle("🖤 \(post.numberOfLikes) Likes", for: [])
    timeAgoLabel.text = post.timeAgo
    
    
    
    }
}
