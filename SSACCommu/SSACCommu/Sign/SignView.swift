//
//  SignView.swift
//  SSACCommu
//
//  Created by 성민주민주 on 2022/01/03.
//

import UIKit
import SnapKit

class SignView: UIView {

    
    let emailTextField = UITextField()
    let nickNameTextField = UITextField()
    let passwordTextField = UITextField()
    let confirmPasswordTextField = UITextField()
    let signButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
        setupConstraints()
    }

    
    func configure() {
        emailTextField.setupTextField(placeholderText: "이메일 주소")
        nickNameTextField.setupTextField(placeholderText: "닉네임")
        passwordTextField.setupTextField(placeholderText: "비밀번호")
        confirmPasswordTextField.setupTextField(placeholderText: "비밀번호 확인")
        signButton.setupButton(title: "가입하기")
    
        
        
    }
    
    
    func setupConstraints() {
        [emailTextField, nickNameTextField, passwordTextField, confirmPasswordTextField, signButton].forEach {
            addSubview($0)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(50)
        }
        
        nickNameTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(20)
            $0.leading.equalTo(emailTextField)
            $0.trailing.equalTo(emailTextField)
            $0.height.equalTo(emailTextField)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(nickNameTextField.snp.bottom).offset(20)
            $0.leading.equalTo(emailTextField)
            $0.trailing.equalTo(emailTextField)
            $0.height.equalTo(emailTextField)
        }
        
        confirmPasswordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.leading.equalTo(emailTextField)
            $0.trailing.equalTo(emailTextField)
            $0.height.equalTo(emailTextField)
        }
        
        signButton.snp.makeConstraints {
            $0.top.equalTo(confirmPasswordTextField.snp.bottom).offset(20)
            $0.leading.equalTo(passwordTextField)
            $0.trailing.equalTo(passwordTextField)
            $0.height.equalTo(passwordTextField)
        }
    }
    
}
