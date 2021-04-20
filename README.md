# Unical Ricca'S Students
Project for INGSW and Web Computing by Lucisano Claudio, Polacchini Rino, Pucci Davide e Russo Lorenzo.

Documentation available: [here](https://studentiunical.sharepoint.com/:b:/r/sites/URSSUnicalRiccaSStudents/Shared%20Documents/General/Presentazione%20PayBall8.pdf?csf=1&web=1&e=SICQo0)

Install the docker container with the volume in `PayBallVolume.rar`

To import the `PayBall8.sql` file, found in `java/it/urss/resources/`, run the following command (in powershell):
```
cmd /c '.\psql.exe -U postgres -d PayBall8 < PATH_TO_PayBall8.sql'
```
followed by the password of the db: `Anda_0917`

There is a "dummy" account you can access:
mail - test@gmail.com
pwd - TESTTEST
