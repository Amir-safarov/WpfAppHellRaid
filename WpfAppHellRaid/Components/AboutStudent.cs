//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WpfAppHellRaid.Components
{
    using System;
    using System.Collections.Generic;
    
    public partial class AboutStudent
    {
        public int ID_stud { get; set; }
        public Nullable<int> ID_school { get; set; }
        public Nullable<double> Average_Mark { get; set; }
    
        public virtual School School { get; set; }
        public virtual Student Student { get; set; }
    }
}
