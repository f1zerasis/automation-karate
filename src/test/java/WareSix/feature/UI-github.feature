@ui
Feature: Karate browser automation 

Background:
  * configure driver = { type: 'chrome' }
  * def variable = karate.callSingle('classpath:Helpers/Variables.feature')
  * def username = variable.username
  * def password = variable.password
  Given driver 'https://gist.github.com/'
  And click("//a[@class='HeaderMenu-link no-underline mr-3']")
  And input("//input[@id='login_field']",username)
  And input("//input[@id='password']",password)
  And submit().click("//input[@name='commit']")

@parallel=false
Scenario Outline: Github Create Gist
  Given click("//a[@aria-label='Create new gist']")
  Given input("//input[@placeholder='Gist description…']","<contentTitle>")
  And input("//input[@placeholder='Filename including extension…']","w6test.txt")
  And mouse("//select[@aria-label='Indent mode']").click()
  And select("//select[@aria-label='Indent mode']", 1)
  And mouse("//select[@aria-label='Indent size']").click()
  And select("//select[@aria-label='Indent size']", 1)
  And mouse("//select[@aria-label='Line wrap mode']").click()
  And select("//select[@aria-label='Line wrap mode']",1)
  And mouse("//div[@class='CodeMirror-scroll']").click()
  And input("//textarea[@placeholder='Enter file contents here']",['<content>', Key.ENTER, 'Content Line 2', Key.ENTER, 'Content Line 3'])
  And mouse("//summary[@aria-label='Select a type of pull request']").click()
  And click("//span[@class='select-menu-item-heading'][normalize-space()='Create public gist']").click()
  And mouse("//button[normalize-space()='Create public gist']").click()
  And waitForText("//div[@itemprop='about']", "<contentTitle>")
  And screenshot()

Examples:
  | contentTitle                 | content    |
  | Backend Monorepo CIv2        | APEX       |
  | Phabricator                  | ARC DIFF   |
  | Build Metric Dashboard       | BUILD      |

@parallel=false
Scenario Outline: Update Gist
  Given click("//summary[@aria-label='View profile and more']")
  And click("//a[normalize-space()='Your gists']").click()
  And waitForEnabled("//span[normalize-space()='<contentTitle>']")
  And click("//span[normalize-space()='<contentTitle>']/parent::div/span/a/strong")
  And waitForText("//tr[1]/following-sibling::tr[1]/td[2]","Content Line 2")
  And click("//a[@class='btn btn-sm' and @aria-label='Edit this Gist']")
  And mouse("//div[@class='CodeMirror-scroll']").click()
  And input("//textarea",[Key.ENTER, '<content>'])
  And click("//button[@class='btn-primary btn']")
  And waitForEnabled("//td[contains(text(), '<content>')]/parent::tr/preceding-sibling::tr/td[contains(text(), 'Content Line 3')]")
  And screenshot()

  Examples:
  | contentTitle                 | content          |
  | Backend Monorepo CIv2        | APEX Update      |
  | Phabricator                  | ARC DIFF Update  |
  | Build Metric Dashboard       | BUILD Update     |

@parallel=false
Scenario Outline: List, view and delete Gist
  Given click("//summary[@aria-label='View profile and more']")
  And click("//a[normalize-space()='Your gists']").click()
  And waitForEnabled("//span[normalize-space()='<contentTitle>']")
  And click("//span[normalize-space()='<contentTitle>']/parent::div/span/a/strong")
  And waitForText("//tr[1]/following-sibling::tr[1]/td[2]","Content Line 2")
  And waitForText("//task-lists/parent::div/preceding-sibling::div","<contentTitle>")
  And click("//button[@class='btn-danger btn-sm btn']")
  Then dialog(true)
  And screenshot()

  Examples:
  | contentTitle                 | 
  | Backend Monorepo CIv2        |
  | Phabricator                  |
  | Build Metric Dashboard       |