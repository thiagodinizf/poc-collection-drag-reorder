//
//  ViewController.swift
//  poc-collection-drag-reorder
//
//  Created by Thiago Diniz on 03/05/18.
//  Copyright © 2018 Thiago Diniz. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UICollectionViewController {

    var array: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        installsStandardGestureForInteractiveMovement = true
        
        array.append("http://webportal.nowonline.com.br/img/channels/multishow.png")
        array.append("http://webportal.nowonline.com.br/img/channels/sportv.png")
        array.append("http://webportal.nowonline.com.br/img/channels/mtv.png")
        array.append("http://webportal.nowonline.com.br/img/channels/national_geographic.png")
        array.append("http://webportal.nowonline.com.br/img/channels/discovery_h_h.png")
        array.append("http://webportal.nowonline.com.br/img/channels/gloob.png")
        array.append("http://webportal.nowonline.com.br/img/channels/gnt.png")
        array.append("http://webportal.nowonline.com.br/img/channels/canal_off.png")
        array.append("http://webportal.nowonline.com.br/img/channels/discovery_kids.png")
        array.append("http://webportal.nowonline.com.br/img/channels/cartoon_network.png")
        array.append("http://webportal.nowonline.com.br/img/channels/zoo_moo.png")
        array.append("http://webportal.nowonline.com.br/img/channels/hbo.png")
        array.append("http://webportal.nowonline.com.br/img/channels/fox_premium.png")
        array.append("http://webportal.nowonline.com.br/img/channels/amc.png")
        array.append("http://webportal.nowonline.com.br/img/channels/crackle.png")
        array.append("http://webportal.nowonline.com.br/img/channels/megapix.png")
        array.append("http://webportal.nowonline.com.br/img/channels/tele_cine.png")
        array.append("http://webportal.nowonline.com.br/img/channels/claro_video.png")
        array.append("http://webportal.nowonline.com.br/img/channels/tnt_series.png")
        array.append("http://webportal.nowonline.com.br/img/channels/space.png")
        array.append("http://webportal.nowonline.com.br/img/channels/tbs.png")
        array.append("http://webportal.nowonline.com.br/img/channels/nat_geo_kids.png")

        collectionView?.register(UINib(nibName: "ItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
    }
    
    func moveAtIndexPath(indexPath: IndexPath, toIndexPath: IndexPath) {
        if indexPath == toIndexPath {
            return
        }
        let channel = array[indexPath.item]
        array.remove(at: indexPath.item)
        array.insert(channel, at: toIndexPath.item)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ItemCollectionViewCell
        cell.url(array[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (self.view.frame.width/3) - 10
        
        return CGSize(width: width, height: width);
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
    override func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        moveAtIndexPath(indexPath: sourceIndexPath, toIndexPath: destinationIndexPath)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ItemCollectionViewCell
        cell.channel.backgroundColor = UIColor.orange
    }
}

