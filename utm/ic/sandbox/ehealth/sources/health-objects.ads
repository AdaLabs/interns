
with Health.Interfaces;

package Health.Objects is

 function  Person_Calorie_burned (Person : in Interfaces.Human'Class) return Calorie_Type;
 function  Person_BMI (Person : in Interfaces.Human'Class) return BMI_Type;
 function  Project_Weight_Gain (Person : in Interfaces.Human'Class) return Mass_Type;
 function Ideal_Body_Weight (Person : in Interfaces.Human'Class) return Mass_Type;
 function Weight_Loss_Required (Person : in Interfaces.Human'Class) return Mass_Type;
 function   Total_Daily_Energy_Expenditure (Person : in Interfaces.Human'Class) return Calorie_Type;


end Health.Objects;
