//
//  FBError.swift
//  Signin With Apple
//
//  Created by Stewart Lynch on 2020-03-18.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

import Foundation


// MARK: - SignIn with Apple Erors
enum SignInWithAppleAuthError: Error {
    case noAuthDataResult
    case noIdentityToken
    case noIdTokenString
    case noAppleIDCredential
}

extension SignInWithAppleAuthError: LocalizedError {
    // This will provide me with a specific localized description for the SignInWithAppleAuthError
    var errorDescription: String? {
        switch self {
        case .noAuthDataResult:
            return NSLocalizedString("No Auth Data Result", comment: "")
        case .noIdentityToken:
            return NSLocalizedString("Unable to fetch identity token", comment: "")
        case .noIdTokenString:
            return NSLocalizedString("Unable to serialize token string from data", comment: "")
        case .noAppleIDCredential:
            return NSLocalizedString("Unable to create Apple ID Credential", comment: "")
        }
    }
}

// MARK: - Signin in with email errors
enum EmailAuthError: Error {
    case incorrectPassword
    case invalidEmail
    case accoundDoesNotExist
    case unknownError
    case couldNotCreate
    case extraDataNotCreated
}

extension EmailAuthError: LocalizedError {
    // This will provide me with a specific localized description for the EmailAuthError
    var errorDescription: String? {
        switch self {
        case .incorrectPassword:
            return NSLocalizedString("Неверный пароль.", comment: "")
        case .invalidEmail:
             return NSLocalizedString("Неверный email.", comment: "")
        case .accoundDoesNotExist:
            return NSLocalizedString("Неверный email. Аккаунт не зарегистрирован.", comment: "")
        case .unknownError:
            return NSLocalizedString("Неизвестная ошибка. Вход невозможен.", comment: "")
        case .couldNotCreate:
            return NSLocalizedString("Невозможно зарегистророваться сейчас.", comment: "")
        case .extraDataNotCreated:
            return NSLocalizedString("Не удалось сохранить полное имя пользователя.", comment: "")
        }
    }
}




