package Spark.Services
with  SPARK_Mode => On
is

--  type Index is range 1 .. 10;
--     type Element is new Integer;
--
--     type Arr is array (Index) of Element;
--
--     function Search
--       (A        : Arr;
--        Val      : Element;
--        At_Index : out Index) return Boolean;

  type Index is range 1 .. 10;
   type Element is new Integer;

   type Arr is array (Index) of Element;

   type Search_Result is record
      Found    : Boolean;
      At_Index : Index;
   end record;

   function Search
     (A   : Arr;
      Val : Element) return Search_Result;
end Spark.Services;
