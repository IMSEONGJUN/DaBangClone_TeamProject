import UIKit
import SnapKit
import Then
import Alamofire

class SignUpViewController: UIViewController {
  
  let nameLabel = UILabel().then {
    $0.text = "이름"
  }
  
  let emailLabel = UILabel().then {
    $0.text = "이메일"
  }
  
  let pwLabel = UILabel().then {
    $0.text = "비밀번호"
  }
  
  let nameTextField = UITextField().then {
    //    $0.layer.borderColor = UIColor.gray.cgColor
    $0.placeholder = "한글 또는 영문만 입력가능"
  }
  
  let emailTextField = UITextField().then {
    $0.placeholder = "hello@dabangapp.com"
  }
  
  //  let pwTextField = UITextField().then {
  //    $0.background = UIImage(named: "pwFrame")
  //  }
  
  let pwImageView = UIImageView().then {
    $0.image = UIImage(named: "pwFrame")
  }
  
  let pwTopTextField = UITextField().then {
    $0.placeholder = "8자리 이상 영문자, 숫자, 특수문자 포함"
    //    $0.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
  }
  
  let pwBottomTextField = UITextField().then {
    $0.placeholder = "비밀번호 확인"
    //    $0.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
  }
  
  let bottomGrayView = UIView().then {
    $0.backgroundColor = UIColor(named: "TextFieldColor")
  }
  
  let completeButton = UIButton().then {
    $0.setTitle("회원가입 완료", for: .normal)
    $0.setTitleColor(#colorLiteral(red: 0.7097486854, green: 0.7098352313, blue: 0.7097191215, alpha: 1), for: .normal)
    $0.layer.borderWidth = 0.8
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.cornerRadius = 4
    $0.backgroundColor = #colorLiteral(red: 0.9951116443, green: 1, blue: 0.9956502318, alpha: 1)
    $0.addTarget(self, action: #selector(didTapCompleteButton), for: .touchUpInside)
  }
  
  let bottomGuideLabel = UILabel().then {
    $0.text = """
    회원가입에 문제가 있을 시 일반회원 고객센터로 전화해주시면
    친절히 안내해 드리겠습니다.
    """
    $0.numberOfLines = 2
    $0.textColor = .gray
    $0.textAlignment = .center
    $0.font = UIFont.systemFont(ofSize: 14, weight: .light)
  }
  
  let bottomCallNumLabel = UILabel().then {
    $0.text = "고객센터 02-1899-6840"
    $0.textColor = .gray
    $0.textAlignment = .center
    $0.font = UIFont.systemFont(ofSize: 12, weight: .bold)
  }
  
  var buttonCheck = false
  //  let pwAlertLabel = UILabel().then {
  //    $0.text = "비밀번호 확인이 동일하지 않습니다."
  //    $0.textColor = .white
  //    $0.textAlignment = .center
  //  }
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.navigationBar.isHidden = false
    view.backgroundColor = .white
    setUI()
    setupConstraints()
    navigationItem.title = "회원가입"
    //    pwBottomTextField.delegate = self
  }
  func setUI() {
    view.addSubviews([
      nameLabel,
      emailLabel,
      pwLabel,
      nameTextField,
      emailTextField,
      bottomGrayView,
      pwImageView,
      pwTopTextField,
      pwBottomTextField
    ])
    
    pwImageView.addSubviews([
    ])
    
    bottomGrayView.addSubviews([
      bottomGuideLabel,
      bottomCallNumLabel,
      completeButton
    ])
    
    [nameLabel, emailLabel, pwLabel].forEach {
      $0.textColor = .black
      $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    
    [nameTextField, emailTextField].forEach {
      $0.font = UIFont.systemFont(ofSize: 16, weight: .medium)
      $0.layer.borderWidth = 0.6
      $0.layer.borderColor = UIColor.lightGray.cgColor
      $0.layer.cornerRadius = 4
      $0.addLeftPadding()
      $0.delegate = self
    }
    
    [pwTopTextField, pwBottomTextField].forEach {
      $0.font = UIFont.systemFont(ofSize: 16, weight: .medium)
      //   $0.isSecureTextEntry = true
      $0.textContentType = .password
      $0.delegate = self
      $0.addLeftPadding()
      //      $0.layer.borderWidth = 0.6
      //      $0.layer.borderColor = UIColor.gray.cgColor
      //      $0.layer.cornerRadius = 4
    }
  }
  //MARK: Layout
  private func setupConstraints() {
    nameLabel.snp.makeConstraints {
      $0.leading.equalTo(24)
      $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(32)
    }
    nameTextField.snp.makeConstraints {
      $0.top.equalTo(nameLabel.snp.bottom).offset(16)
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.9)
      $0.height.equalToSuperview().multipliedBy(0.06)
    }
    emailLabel.snp.makeConstraints {
      $0.leading.equalTo(24)
      $0.top.equalTo(nameTextField.snp.bottom).offset(32)
    }
    emailTextField.snp.makeConstraints {
      //      $0.center.equalToSuperview()
      $0.top.equalTo(emailLabel.snp.bottom).offset(16)
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.9)
      $0.height.equalToSuperview().multipliedBy(0.06)
    }
    pwLabel.snp.makeConstraints {
      $0.leading.equalTo(24)
      $0.top.equalTo(emailTextField.snp.bottom).offset(32)
    }
    pwImageView.snp.makeConstraints {
      $0.top.equalTo(pwLabel.snp.bottom).offset(16)
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.9)
      $0.height.equalToSuperview().multipliedBy(0.12)
    }
    pwTopTextField.snp.makeConstraints {
      $0.top.equalTo(pwLabel.snp.bottom).offset(16)
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.9)
      $0.height.equalToSuperview().multipliedBy(0.06)
    }
    pwBottomTextField.snp.makeConstraints {
      $0.top.equalTo(pwTopTextField.snp.bottom).offset(-1)
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.9)
      $0.height.equalToSuperview().multipliedBy(0.06)
    }
    bottomGrayView.snp.makeConstraints {
      $0.bottom.leading.trailing.equalToSuperview()
      $0.top.equalTo(pwBottomTextField.snp.bottom).offset(160)
    }
    completeButton.snp.makeConstraints {
      $0.top.equalToSuperview().offset(24)
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.9)
      $0.height.equalToSuperview().multipliedBy(0.2)
    }
    bottomGuideLabel.snp.makeConstraints {
      $0.top.equalTo(completeButton.snp.bottom).offset(24)
      $0.centerX.equalToSuperview()
    }
    bottomCallNumLabel.snp.makeConstraints {
      $0.top.equalTo(bottomGuideLabel.snp.bottom).offset(16)
      $0.centerX.equalToSuperview()
    }
  }
  //MARK: - 자체 로그인
  @objc private func didTapCompleteButton() {
    if buttonCheck {
      print("로그인완료~")
      //      dismiss(animated: true)
      self.navigationController?.popViewController(animated: true)
    } else {
      print("안댐")
    }
  }
}
extension SignUpViewController: UITextFieldDelegate {
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    view.endEditing(true)
  }
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  func textFieldDidChangeSelection(_ textField: UITextField) {
    print("----check----")
    print(!nameTextField.text!.isEmpty, pwTopTextField.text!.validatePassword(), pwBottomTextField.text!.validatePassword(), emailTextField.text!.validateEmail())
    if !nameTextField.text!.isEmpty && pwTopTextField.text!.validatePassword() && pwBottomTextField.text!.validatePassword() && emailTextField.text!.validateEmail() {
      completeButton.backgroundColor = #colorLiteral(red: 0, green: 0.4173111916, blue: 0.9140619636, alpha: 1)
      completeButton.setTitleColor(.white, for: .normal)
      buttonCheck = true
    } else {
      completeButton.backgroundColor = #colorLiteral(red: 0.9951116443, green: 1, blue: 0.9956502318, alpha: 1)
      completeButton.setTitleColor(#colorLiteral(red: 0.7097486854, green: 0.7098352313, blue: 0.7097191215, alpha: 1), for: .normal)
      buttonCheck = false
    }
    
  }
}

extension UIButton {
  func blackBG() -> UIButton {
    self.backgroundColor = .black
    return self
  }
  
}
