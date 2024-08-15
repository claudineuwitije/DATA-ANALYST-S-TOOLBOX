#### if-else statements ####

# if something happens: do this; else: do that

# if (it is sunny outside){
# then bring your sunglasses
# } else if (it is raining outside) {
# bring your umbrella & rainjacket
# } else {
# bring your umbrella just in case
# }

# Examples

# with characters
char <- c("hello", "goodbye")
char[1]

if (char[1] == "hello") {
  print("goodbye")
} else{
  print("hi")
}

if (char[2] == "hello"){
  print("goodbye")
} else {
  print("hi")
}


value =3 

if (value <3){
  print(TRUE)
}else {
  print(FALSE)
}

# if we want to run the code until we get TRUE
value =3 

if (value < 1){
  print(" hey we made it")
}else {
  value <- value -1
}
value
