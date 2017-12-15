results = "C:\\Users\\Sean\\Downloads\\EPA-CA2-20171214T224540Z-001\\EPA-CA2\\results.dat"
#Check to see was the data read in fully
read.table(results, header = TRUE)


dataSet <- read.delim(results, header = TRUE, sep = "\t")

CO <- (dataSet$C0)
N <- (dataSet$N)
Idle <- (dataSet$Idle)

Ui <- (100 - Idle)

X0 <- (CO / 3)

Di <- ((Ui / 100) * 3) / X0

R <- (N / X0)

#Utilisation Ui
plot (
  N,
  Ui,
  main = "Ui vs N",
  xlab = "Number of Users",
  ylab = "Ui vs Number of Users",
  type = "o"
)

#Service Demand Di
plot (
  N,
  Di,
  main = "Di vs N",
  xlab = "Number of Users",
  ylab = "Di vs Number of Users",
  type = "o"
)

#ThroughPut X0
plot (
  N,
  X0,
  main = "X0 vs N",
  xlab = "Number of Users",
  ylab = "X0 vs Number of Users",
  type = "o"
)

#Average Response Time R
plot (
  N,
  R,
  main = "R vs N",
  xlab = "Number of Users",
  ylab = "R vs Number of Users",
  type = "o"
)

