# automation-karate
This repo contains Karate Automation script that consist API and UI automation

```bash                                                 
 _____ _   _  _____ _______       _      _      
|_   _| \ | |/ ____|__   __|/\   | |    | |     
  | | |  \| | (___    | |  /  \  | |    | |     
  | | | . ` |\___ \   | | / /\ \ | |    | |     
 _| |_| |\  |____) |  | |/ ____ \| |____| |____ 
|_____|_| \_|_____/   |_/_/    \_\______|______|
```

# To run UI automation
```mvn test -Dkarate.options="--tags @ui"```

# To run API automation
```mvn test -Dkarate.options="--tags @api"```