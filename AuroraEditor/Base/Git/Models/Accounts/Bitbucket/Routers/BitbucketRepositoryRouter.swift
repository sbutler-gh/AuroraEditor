//
//  BitbucketRepositoryRouter.swift
//  AuroraEditorModules/GitAccounts
//
//  Created by Nanashi Li on 2022/03/31.
//

import Foundation

public enum BitbucketRepositoryRouter: Router {
    case readRepositories(GitConfiguration, String?, [String: String])
    case readRepository(GitConfiguration, String, String)

    public var configuration: GitConfiguration? {
        switch self {
        case .readRepositories(let config, _, _): return config
        case .readRepository(let config, _, _): return config
        }
    }

    public var method: HTTPMethod {
        .GET
    }

    public var encoding: HTTPEncoding {
        .url
    }

    public var params: [String: Any] {
        switch self {
        case .readRepositories(_, let userName, var nextParameters):
            if userName != nil {
                return nextParameters as [String: Any]
            } else {
                nextParameters += ["role": "member"]
                return nextParameters as [String: Any]
            }
        case .readRepository:
            return [:]
        }
    }

    public var path: String {
        switch self {
        case .readRepositories(_, let userName, _):
            if let userName = userName {
                return "repositories/\(userName)"
            } else {
                return "repositories"
            }
        case let .readRepository(_, owner, name):
            return "repositories/\(owner)/\(name)"
        }
    }
}
