# automation-karate
This repo contains Karate Automation script that consist API and UI automation

# prerequisite
1. Install Java
2. Install Maven
3. Before Install & running the automation please update `src/test/java/Helpers/Variables.feature` file to your Github account.

```bash                                                 
 _____ _   _  _____ _______       _      _      
|_   _| \ | |/ ____|__   __|/\   | |    | |     
  | | |  \| | (___    | |  /  \  | |    | |     
  | | | . ` |\___ \   | | / /\ \ | |    | |     
 _| |_| |\  |____) |  | |/ ____ \| |____| |____ 
|_____|_| \_|_____/   |_/_/    \_\______|______|
```

# to Install & run UI automation
```mvn test -Dkarate.options="--tags @ui"```

# to Install run API automation
```mvn test -Dkarate.options="--tags @api"```