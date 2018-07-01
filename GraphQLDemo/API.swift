//  This file was automatically generated and should not be edited.

import Apollo

public final class MessageQueryQuery: GraphQLQuery {
  public static let operationString =
    "query MessageQuery {\n  allMessage {\n    __typename\n    id\n    subject\n    description\n    category\n    sender {\n      __typename\n      email\n      firstName\n      lastName\n    }\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("allMessage", type: .list(.object(AllMessage.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(allMessage: [AllMessage?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "allMessage": allMessage.flatMap { (value: [AllMessage?]) -> [Snapshot?] in value.map { (value: AllMessage?) -> Snapshot? in value.flatMap { (value: AllMessage) -> Snapshot in value.snapshot } } }])
    }

    public var allMessage: [AllMessage?]? {
      get {
        return (snapshot["allMessage"] as? [Snapshot?]).flatMap { (value: [Snapshot?]) -> [AllMessage?] in value.map { (value: Snapshot?) -> AllMessage? in value.flatMap { (value: Snapshot) -> AllMessage in AllMessage(snapshot: value) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { (value: [AllMessage?]) -> [Snapshot?] in value.map { (value: AllMessage?) -> Snapshot? in value.flatMap { (value: AllMessage) -> Snapshot in value.snapshot } } }, forKey: "allMessage")
      }
    }

    public struct AllMessage: GraphQLSelectionSet {
      public static let possibleTypes = ["EMessage"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .scalar(GraphQLID.self)),
        GraphQLField("subject", type: .scalar(String.self)),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("category", type: .scalar(String.self)),
        GraphQLField("sender", type: .object(Sender.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID? = nil, subject: String? = nil, description: String? = nil, category: String? = nil, sender: Sender? = nil) {
        self.init(snapshot: ["__typename": "EMessage", "id": id, "subject": subject, "description": description, "category": category, "sender": sender.flatMap { (value: Sender) -> Snapshot in value.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID? {
        get {
          return snapshot["id"] as? GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var subject: String? {
        get {
          return snapshot["subject"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "subject")
        }
      }

      public var description: String? {
        get {
          return snapshot["description"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "description")
        }
      }

      public var category: String? {
        get {
          return snapshot["category"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "category")
        }
      }

      public var sender: Sender? {
        get {
          return (snapshot["sender"] as? Snapshot).flatMap { Sender(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "sender")
        }
      }

      public struct Sender: GraphQLSelectionSet {
        public static let possibleTypes = ["Sender"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .scalar(String.self)),
          GraphQLField("firstName", type: .scalar(String.self)),
          GraphQLField("lastName", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(email: String? = nil, firstName: String? = nil, lastName: String? = nil) {
          self.init(snapshot: ["__typename": "Sender", "email": email, "firstName": firstName, "lastName": lastName])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var email: String? {
          get {
            return snapshot["email"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "email")
          }
        }

        public var firstName: String? {
          get {
            return snapshot["firstName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "firstName")
          }
        }

        public var lastName: String? {
          get {
            return snapshot["lastName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "lastName")
          }
        }
      }
    }
  }
}

public final class MessageCreatorMutation: GraphQLMutation {
  public static let operationString =
    "mutation MessageCreator($subject: String!, $description: String!, $category: String, $senderEmail: String) {\n  createMessage(subject: $subject, description: $description, category: $category, senderEmail: $senderEmail)\n}"

  public var subject: String
  public var description: String
  public var category: String?
  public var senderEmail: String?

  public init(subject: String, description: String, category: String? = nil, senderEmail: String? = nil) {
    self.subject = subject
    self.description = description
    self.category = category
    self.senderEmail = senderEmail
  }

  public var variables: GraphQLMap? {
    return ["subject": subject, "description": description, "category": category, "senderEmail": senderEmail]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createMessage", arguments: ["subject": GraphQLVariable("subject"), "description": GraphQLVariable("description"), "category": GraphQLVariable("category"), "senderEmail": GraphQLVariable("senderEmail")], type: .scalar(String.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createMessage: String? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createMessage": createMessage])
    }

    public var createMessage: String? {
      get {
        return snapshot["createMessage"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "createMessage")
      }
    }
  }
}