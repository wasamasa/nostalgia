identification division.
program-id. blinmaker.

data division.
working-storage section.
77 eggs_amount  pic 999.
77 eggs_min     pic 999 value 1.
77 milk_amount  pic 99999.
77 milk_min     pic 99999 value 200. *> milliliter
77 flour_amount pic 99999.
77 flour_min    pic 99999 value 100. *> grams
77 smallest     pic 99999.
77 blin_amount  pic zzzzz.
77 eggs_needed  pic zzzzz.
77 milk_needed  pic zzzzz.
77 flour_needed pic zzzzz.

procedure division.
main.
   display 'Hello Boris!'.
   display 'Blinmaker is starting up..'.
   display 'How many eggs you have?'
   accept eggs_amount.
   display 'How much milk you have?'
   accept milk_amount.
   display 'How much flour you have?'
   accept flour_amount.

   if eggs_amount < eggs_min or milk_amount < milk_min or flour_amount < flour_min
      display 'no blin today :('
   else
      compute flour_amount = flour_amount / flour_min
      compute milk_amount = milk_amount / milk_min
      compute smallest = function min(eggs_amount, milk_amount, flour_amount)
      compute blin_amount = smallest * 4
      display ' '
      display 'You can make ' function trim(blin_amount) ' of blins'
      display ' '
      multiply smallest by eggs_min giving eggs_needed
      display 'You will need ' function trim(eggs_needed) ' eggs'
      multiply smallest by flour_min giving flour_needed
      display 'You will need ' function trim(flour_needed) ' grams flour'
      multiply smallest by milk_min giving milk_needed
      display 'You will need ' function trim(milk_needed) 'ml milk'
      display ' '
      display 'Blinmaker shutting down..'
   end-if.
   goback.

end program blinmaker.
