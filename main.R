full <- read_csv("rpgcodex-top-jrpgs-2022 - Pure.csv")
# using min's data
#model = lm( `Min-7 Average`~Popularity, data=full)
#line = predict(model, newdata=data.frame(Popularity = full$Popularity))
#summary(model)
#plot(full$Popularity, full$`Min-7 Average`)
#lines(full$Popularity, line)

# using pure average 
full = subset(full, `Pure Average` != "#DIV/0!")
model = lm( `Pure Average`~Popularity, data=full)
line = predict(model, newdata=data.frame(Popularity = full$Popularity))
tmp = summary(model)
plot(full$Popularity, full$`Pure Average`, xlab="Popularity", ylab="Average", main="Popularity to Average comparsion chart", )
lines(full$Popularity, line)

print(sprintf("Average = %f + %f Popularity, the R2 (AKA the error) is %f", model$coefficients[1], model$coefficients[2], tmp$r.squared))
print(tmp)
print("Testing for t score")



t = tmp$coefficients[2]/tmp$coefficients[4]
range = qt(1-.05/2, length(full)-2)
if(t<range || t > -range){
  print("Linearly significant")
} else{
  print("Not linearly significant")
}

