def random_tags
  Tag.all.filter { rand < 0.35 }
end

project_data = [
  {
    name: 'Project 1',
    description: 'Just an example project.'
  },
  {
    name: 'Project 2',
    description: 'Just an example project.'
  }
]

Project.create(project_data)

tag_data = [
  {
    name: 'Tag 1'
  },
  {
    name: 'Tag 2'
  },
  {
    name: 'Tag 3'
  },
  {
    name: 'Tag 4'
  },
  {
    name: 'Tag 5'
  }
]

Tag.create(tag_data)

user_data = [
  {
    name: 'Admin',
    email_address: 'admin@example.com',
    password: 'password'
  },
  {
    name: 'Example User',
    email_address: 'example@example.com',
    password: 'example123@'
  }
]

User.create(user_data)

ticket_data = [
  {
    name: 'Ticket 1',
    body: 'This is an example ticket body message',
    status: 'new',
    project: Project.first,
    open: true,
    creator: User.first,
    assignee: User.second,
    tags: random_tags
  },
  {
    name: 'Ticket 2',
    body: 'This is another example ticket body message',
    status: 'fixed',
    project: Project.first,
    open: false,
    creator: User.first,
    tags: random_tags
  },
  {
    name: 'Ticket 3',
    body: 'This is also yet another example ticket body message',
    status: 'in_progress',
    project: Project.second,
    open: true,
    creator: User.second,
    assignee: User.second,
    tags: random_tags
  }
]

Ticket.create(ticket_data)

comment_data = [
  {
    body: 'This is an example comment number 1.',
    creator: User.first,
    ticket: Ticket.first
  },
  {
    body: 'This is an example comment number 2.',
    creator: User.first,
    ticket: Ticket.second
  },
  {
    body: 'This is an example comment number 3.',
    creator: User.first,
    ticket: Ticket.third
  },
  {
    body: 'This is an example comment number 4.',
    creator: User.second,
    ticket: Ticket.first
  },
  {
    body: 'This is an example comment number 5.',
    creator: User.second,
    ticket: Ticket.second
  }
]

Comment.create(comment_data)
