golf_contacts = {
  jim: 'workerBee@example.com',
  samantha: 'golfCartRacer@example.com',
  jane: 'pro_golfer89@example.com',
  mike: 'alwaysAtTheBeach@example.com',
  olivia: 'didYouSeeWhereThatWent@example.com',
  joan: 'bestShortGameEver@example.com'
}

email_to = [ golf_contacts[:samantha], golf_contacts[:jane], golf_contacts[:olivia] ]

puts email_to.join(',')