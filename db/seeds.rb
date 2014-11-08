money = Goal.create({ key_name: 'Financial Security',
    description: 'Pay off all major debts',
    dod: 'Complete Omnifocus List'})

friend = Goal.create({ key_name: 'Friends/Family',
    description: 'Have a strong friend and family network',
    dod: ''})

language = Goal.create({ key_name: 'Spanish/German',
    description: 'Have spanish/german proficients',
    dod: ''})

programming = Goal.create({ key_name: 'Programming',
    description: 'Being a Good and Passionate Programmer',
    dod: ''})

fitness = Goal.create({ key_name: 'Fitness',
    description: 'Both Wash and I being in good shape',
    dod: ''})

automation = Goal.create({ key_name: 'Automation',
    description: 'Automate everything else...',
    dod: 'Complete omnifocus list'})

headphones = Resource.create({name: 'headphones'})
computer = Resource.create({ name: 'computer' })
phone_call = Resource.create({ name: 'phone(call)' })
home = Resource.create({ name: 'home' })
office = Resource.create({ name: 'office' })
car = Resource.create({ name: 'car' })

Task.create(
  { name: 'Inbox 0',
    site: 'http://www.gmail.com',
    description: 'Start at the top and if no action required, delete or label, else omnifocus or handle',
    minutes: 5,
    resources: [computer],
    goals: [friend, programming]}
)

Task.create(
  { name: 'Call Mom and Dad',
    site: nil,
    description: nil,
    minutes: 45,
    resources: [phone_call],
    goals: [friend] }
)

Task.create(
  { name: 'Duolingo',
    site: 'http://www.duolingo.com',
    description: 'Fart around',
    minutes: 5,
    resources: [headphones],
    goals: [language] }
)

Task.create(
  { name: 'Mr. Money Mustache',
    site: 'http://www.mrmoneymustache.com/2011/04/06/meet-mr-money-mustache/',
    description: 'Money Blog',
    minutes: 10,
    resources: [computer],
    goals: [money] }
)


#Task.create(
  #{ name: '',
    #site: '',
    #description: '',
    #minutes: 15,
#    resources: [],
#    goals: [] }
#)


