﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class SpecialForWPFSafEntities1 : DbContext
    {
        public SpecialForWPFSafEntities1()
            : base("name=SpecialForWPFSafEntities1")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<AboutStudent> AboutStudent { get; set; }
        public virtual DbSet<Department> Department { get; set; }
        public virtual DbSet<Discipline> Discipline { get; set; }
        public virtual DbSet<Employee> Employee { get; set; }
        public virtual DbSet<Exasm> Exasm { get; set; }
        public virtual DbSet<Faculty> Faculty { get; set; }
        public virtual DbSet<Job_title> Job_title { get; set; }
        public virtual DbSet<Request> Request { get; set; }
        public virtual DbSet<School> School { get; set; }
        public virtual DbSet<SchoolTitle> SchoolTitle { get; set; }
        public virtual DbSet<Speciality> Speciality { get; set; }
        public virtual DbSet<Student> Student { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
    }
}
