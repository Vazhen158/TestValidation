//
//  MailResponceModel.swift
//  TestValidation
//
//  Created by Андрей Важенов on 07.04.2022.
//

import Foundation

struct MailResponceModel: Decodable {
    let result: String
    let reason: String
    let did_you_mean: String?
    let success: Bool
    
//    var reasonDescription: String {
//        switch reason {
//
//        case "invalid_email":
//          print("Specified email is not a valid email address syntax")
//
//        case "invalid_domain":
//            print("Domain for email does not exist")
//
//        case "rejected_email":
//            print(" Email address was rejected by the SMTP server, email address does not exist")
//
//        case "accepted_email":
//            print("Email address was accepted by the SMTP server")
//
//        case "low_quality":
//            print("Email address has quality issues that may make it a risky or low-value address")
//
//        case "low_deliverability":
//            print("Email address appears to be deliverable, but deliverability cannot be guaranteed")
//
//        case "no_connect":
//            print("Could not connect to SMTP server")
//
//        case "timeout":
//            print("SMTP session timed out")
//
//        case "invalid_smtp":
//            print("SMTP server returned an unexpected/invalid response")
//
//        case "unavailable_smtp":
//            print("SMTP server was unavailable to process our request")
//
//        case "unexpected_error":
//            print("An unexpected error has occurred")
//        default: break
//        }
//    }
}
