#### Objective
Functional test automation for scenarios in web technology. 
 
##### Project features: 
* Language: Python 
* Automation Frame: RobotFrameWork 
* Behavior Driven Development  
 
#### Initial Setup
* Access your command prompt and check the Python version typing python -V (MAC) or python ––version (Windows)
* Check the PIP version typing pip -V. If you need, install pip typing sudo easy_install pip
* Install RobotFramework:
    * pip install robotframework 
    * pip install robotframework-seleniumlibrary
* Install WebDriver Chrome: 
    * MAC:
        * brew cask install chromedriver
    * Windows:
        * Access https://chromedriver.chromium.org/downloads 
        * Download the Chrome driver according with your browser (check your version in Help > About Google Chrome) 
        * Go to the folder where the downloaded file is and press the keys: (shift + command + g) and type /usr/bin/local 
        * Copy Chromedriver to the bin folder 
* Install PyCharm IDE: 
    * Access: https://www.jetbrains.com/pycharm/download/#section=mac 
    * Download pycharm and install the ide 
    * After install, access PyCharm > Preferences > Plugins > type IntelliBot and then acess PyCharm > Preferences > Project > Project Interpreter
    * Add:  
        * robotframework  
        * robotframework-seleniumlibrary 
        * Selenium 
        * Wheel 
        * Pip 
        * Wsgiref 
* Execute a test: robot –d (path folder results) (path folder features) 
    * Example: robot -d /Users/cintiaalves/PycharmProjects/robotTDD 2/results /Users/cintiaalves/PycharmProjects/robotTDD 2/tests/cucumber/features/Login.robot