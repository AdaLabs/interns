package Health.Interfaces is

   type Human is interface;

   function Name     (H : in Human) return String        is abstract;
   function Age      (A : in Human) return Year_Type     is abstract;
   function Gender   (G : in Human) return Gender_Type   is abstract;
   function Weight   (W : in Human) return Mass_Type     is abstract;
   function Height   (H : in Human) return Height_Type   is abstract;
   function Activity (A : in Human) return Activity_Kind is abstract;

end Health.Interfaces;
