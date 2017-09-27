package Health.Interfaces is

   ----------------
   ------Human-----
   ----------------

   type Human is interface;

   function Name     (H : in Human) return String        is abstract;
   function Age      (H : in Human) return Year_Type     is abstract;
   function Gender   (H : in Human) return Gender_Type   is abstract;
   function Weight   (H : in Human) return Mass_Type     is abstract;
   function Height   (H : in Human) return Height_Type   is abstract;
   function Activity (H : in Human) return Activity_Kind is abstract;
   function Heart_Rate (H : in Human) return Heart_Rate_Type is abstract;
   function Minutes (H : in Human) return Minute_Type is abstract;

   procedure Set_Height (H      : in out Human;
                         Height : in     Height_Type) is abstract;

   procedure Set_Weight (H       : in out Human;
                         Weight  : in     Mass_Type) is abstract;

   procedure Set_Age     (H   : in out Human;
                          Age : in     Year_Type) is abstract;

   procedure Set_Activity (H         : in out Human;
                           Activity  : in     Activity_Kind) is abstract;
   procedure Set_Heart_Rate (H           : in out Human;
                             Heart_Rate  : in     Heart_Rate_Type) is abstract;
   procedure Set_Minuites (H         : in out Human;
                           Minutes   : in     Minute_Type) is abstract;

end Health.Interfaces;
