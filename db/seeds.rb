User.create([
  { username: "Dan", email:"dan@dan.dan", password:"password"},
  { username: "Ray", email:"Ray@Ray.Ray", password:"password"},
  { username: "Gino", email:"Gino@Gino.Gino", password: "password"},
  { username: "Marshall", email:"Marshall@Marshall.Marshall", password: "password"},

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
    title: "This certificate has an invalid issuer Apple Push Services",
    body: "I have created certificate to enable Push Services in my app, but every time I try to add certificate in my Keychain, after adding certificate it shows me following error:This certificate has an invalid issuer",
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
