User.create([
  { username: "Dan", email:"dan@dan.dan", password_hash: BCrypt::Password.create("password")},
  { username: "Ray", email:"Ray@Ray.Ray", password_hash: BCrypt::Password.create("password")},
  { username: "Gino", email:"Gino@Gino.Gino", password_hash: BCrypt::Password.create("password")},
  { username: "Marshall", email:"Marshall@Marshall.Marshall", password_hash: BCrypt::Password.create("password")},

  ])

Question.create([

  { user_id: 1,
    title: "What is Ruby?",
    body: "Please tell me about this",
    },

  { user_id: 2,
    title: "What is Rails?",
    body: "Please tell me about this",
    },

  { user_id: 3,
    title: "What is JavaScript?",
    body: "Please tell me about this",
    },

  { user_id: 4,
    title: "What is Python?",
    body: "Please tell me about this",
    },
  ])

Answer.create([

  { user_id: 1,
    question_id: 2,
    body: "Try stack overflow.",
    },

  { user_id: 2,
    question_id: 3,
    body: "Try stack overflow.",
    },

  { user_id: 3,
    question_id: 4,
    body: "Try stack overflow.",
    },

  { user_id: 4,
    question_id: 1,
    body: "Try stack overflow.",
    },
  ])
