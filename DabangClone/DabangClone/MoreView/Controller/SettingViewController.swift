import UIKit
// 20 기본 2단위 늘리기 8의 배수 4배수 2배수
class SettingViewController: UIViewController {
  let settingData = settingDatas
  let tableView = UITableView().then {
    $0.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
    $0.allowsSelection = false
    //    $0.estimatedRowHeight = 88.0
    //    $0.rowHeight = UITableView.automaticDimension
  }
  //MARK: - Life Cyclev
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
    self.title = "설정"
    self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "multiply"), style: .plain, target: self, action: #selector(didTapBackButton(_:)))
    self.navigationItem.leftBarButtonItem?.tintColor = .black
    setupUI()
  }
  // MARK: -Action
  @objc private func didTapBackButton(_ sender: UIButton) {
    self.dismiss(animated: true)
  }
  //MARK: - SETUP UI
  private func setupUI() {
    self.view.addSubviews([tableView])
    tableView.dataSource = self
    setupConstraints()
  }
  //MARK: - Layout
  private func setupConstraints() {
    tableView.snp.makeConstraints {
      $0.bottom.top.leading.trailing.equalToSuperview()
    }
  }
}
//MARK: - UITableViewDataSource
extension SettingViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    settingData.count
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return settingData[section].options.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as! SettingTableViewCell
    let data = settingData[indexPath.section].options[indexPath.row]
    if indexPath.section == 0 {
      cell.configure(title: data.title, detail: data.detail, detailCheck: true)
      cell.delegate = self
    } else {
      cell.configure(title: data.title, detail: data.detail, detailCheck: false)
    }
    return cell
  }
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let view = SettingSectionView()
    view.configure(title: settingData[section].name)
    return view
  }
}
//MARK: - SettingTableViewCellDelegate
extension SettingViewController: SettingTableViewCellDelegate {
  func didTapDetailButton() {
    let vc = UINavigationController(rootViewController: AddRoomViewController())
    vc.modalPresentationStyle = .fullScreen
    present(vc,animated: true)
    //    let vc = PrivacyPolicyViewController()
    //    vc.modalPresentationStyle = .fullScreen
    //    self.navigationController?.pushViewController(vc, animated: true)
  }
}
