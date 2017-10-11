# FML
Gruppe FML

Kravspec:
Server skal validere login på et hashet password
Server skal kunne oprette en bruger (User”student”/admin”teacher”) 
Server skal kunne oprette en quiz
2 typer af brugere; user og admin
Server skal udskille et API som gør det let at udarbejde klienter, som trækker på serverens funktionalitet. API’et skal have følgende funktionalitet:
	En gæst uden en konto skal kunne oprette en ny konto.
  En bruger kan logge ind og ud.
  En bruger skal kunne tilgå samt besvare en quiz.
  En bruger skal kunne slette sin konto.
  En admin skal kunne oprette og slette quiz
  En admin skal kunne oprette en ny admin. 

Server skal kunne udskille et interface som gør det muligt for admin at oprette og slette quizzer

Klient:
Klienten skal kunne oprette en bruger (user) og herefter tilgå programmet med denne.
Klienten skal udstille et login vindue for brugeren og give brugeren mulighed for at logge ud igen.
Klienten skal kunne oprette og slette quizzer (admin)
Klienten skal kunne tilgå quizzer og besvare dem. (user)
Klienten skal ud fra brugertype kunne vise forskellige menuer for admin og bruger. 
