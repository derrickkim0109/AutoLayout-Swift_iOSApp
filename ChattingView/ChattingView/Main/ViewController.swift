//
//  ViewController.swift
//  ChattingView
//
//  Created by Derrick kim on 2021/04/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate{
 

    //-----------------------------------------
    //              Properties
    //-----------------------------------------
    
    @IBOutlet weak var chatTableListView: UITableView!{
        // Main Storyboard에서 두개 설정하는걸 코드로 친것.
        didSet{
            
            chatTableListView.delegate = self
            chatTableListView.dataSource = self
            
            // 두개다 같은거다. -> 테이블 뷰 구분선 지우기
//            chatTableListView.separatorColor = .none
            chatTableListView.separatorStyle = .none
        }
    }
    
    // 내가 치는 텍스트 만큼 텍스트가 늘어나게 하기 위한 delegate를 불러올거다.
    
    @IBOutlet weak var inputTextView : UITextView!{
        didSet{
            inputTextView.delegate = self
        }
    }
    // TextView 안의 Constant의 길이를 조정하기 위해 불러옴.
    @IBOutlet weak var inputTextViewHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var inputViewBottomMargin : NSLayoutConstraint!
    
    var chatDatas = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 사용하려는 셀을 등록해야 사용할 수 있다.
        chatTableListView.register(UINib(nibName: "MyChatTableViewCell", bundle: nil)
                                   , forCellReuseIdentifier: "myCell")
        
        chatTableListView.register(UINib(nibName: "YourChatTableViewCell", bundle: nil)
                                   , forCellReuseIdentifier: "yourCell")
        
        
        // 키보드 관련 옵저버 설정해야함
        
        // 키보드 올라올때.
        // 전달할 object 없으니까 -> nil
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        
        // 키보드 내려갈때
        // 전달할 object 없으니까 -> nil
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification  , object: nil)
        
    }
    
    
    
    @objc func keyboardWillShow(noti : Notification){
        let notificationInfo = noti.userInfo!  // Dictionary Type
        let keyboardFrame = notificationInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        
        // safeArea는 꼭 빼야함!!!!!!
        let height = keyboardFrame.size.height - self.view.safeAreaInsets.bottom
        
        // 키보드가 움직이는 시간
        let animationDuration = notificationInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
        
        
        // animation 효과
        UIView.animate(withDuration: animationDuration) {
            self.inputViewBottomMargin.constant = height
            self.view.layoutIfNeeded()
        }
        
    }
    
    @objc func keyboardWillHide(noti : Notification){
        
        let notificationInfo = noti.userInfo!  // Dictionary Type
        let keyboardFrame = notificationInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect

        // 키보드가 움직이는 시간
        let animationDuration = notificationInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
       
        //  키보드랑 Textfield와 똑같은 속도로 올라가게 하기위해 animation 조정.
        UIView.animate(withDuration: animationDuration) {
            self.inputViewBottomMargin.constant = 0
            self.view.layoutIfNeeded()
        }
        
        
        
    }
    
    //-----------------------------------------
    //              TableView - Delegate
    //-----------------------------------------
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row % 2 == 0 {
            let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyChatTableViewCell
            
            myCell.myTextView.text = chatDatas[indexPath.row]
            
            // TableView 클릭했을 경우 클릭한 표시 안보이게 하기위한 설정
            myCell.selectionStyle = .none
            
            return myCell
        }else{
            let yourCell = tableView.dequeueReusableCell(withIdentifier: "yourCell", for: indexPath) as! YourChatTableViewCell
            
            yourCell.yourTextView.text = chatDatas[indexPath.row]
            
            // TableView 클릭했을 경우 클릭한 표시 안보이게 하기위한 설정
            yourCell.selectionStyle = .none
            
            return yourCell
        }
       
    }
    
    @IBAction func sendButtonAction(_ sender: UIButton){
        // inputView.text --> chatDatas
        
        chatDatas.append(inputTextView.text)
        
        // 전송후 사라짐.
        inputTextView.text = ""
        
        let lastIndexPath = IndexPath(row: chatDatas.count - 1 , section: 0)
        // 1.
        // Data가 테이블 뷰가 리셋 됬을때 탁탁 튀기 때문에 잘사용안함.
//        chatTableListView.reloadData()
        
        // 2. 가장 마지막에 추가 되는 방식
        chatTableListView.insertRows(at: [lastIndexPath], with: UITableView.RowAnimation.automatic)
        
        
        // 전송했을때 테이블 스크롤 되게
        // 3개의 데이터가 있는 Array일 경우
        // array.count = 3
        // array row = 2 <- 개수 - 1이 가장 마지막 row
        chatTableListView.scrollToRow(at: lastIndexPath, at: UITableView.ScrollPosition.bottom, animated: true)
 
        
        // 텍스트가 위로 밀려서 텍스트 필드 사이즈가 커졌다가 안쓰면 다시 줄어들어야하는데
        // 설정을 해야함.
        inputTextViewHeight.constant = 40
        
        
        
    }
    
    
    //-----------------------------------------
    //           TextView - Delegate
    //-----------------------------------------
    
    func textViewDidChange(_ textView: UITextView) {
        
        // 안쪽의 contentSize를 설정해야함
        // 1. 이런 방식으로 하면 텍스트 크기가 작기 때문에 텍스트 필드가 밀려 보인다. --> 범위를 정해둔다.
        //  그냥 이거만 쓰면 -> inputTextViewHeight.constant = textView.contentSize.height
        
        
        if textView.contentSize.height <= 40{
            inputTextViewHeight.constant = 40
        }else if textView.contentSize.height >= 100 {
            inputTextViewHeight.constant = 100
        }else{
            inputTextViewHeight.constant = textView.contentSize.height
            
        }
        
       
       
    }
    
    
    
    
}

 
