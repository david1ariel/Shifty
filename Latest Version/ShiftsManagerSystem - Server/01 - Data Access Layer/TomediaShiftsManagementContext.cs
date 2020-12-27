using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace CtrlShift
{
    public partial class TomediaShiftsManagementContext : DbContext
    {
        public TomediaShiftsManagementContext()
        {
        }

        public TomediaShiftsManagementContext(DbContextOptions<TomediaShiftsManagementContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Employee> Employees { get; set; }
        public virtual DbSet<FutureShift> FutureShifts { get; set; }
        public virtual DbSet<PastShift> PastShifts { get; set; }
        public virtual DbSet<ShiftType> ShiftTypes { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Server=DESKTOP-161IG8J\\SQLEXPRESS;Database=Tomedia Shifts Management;Trusted_Connection=True");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            

            modelBuilder.Entity<Employee>(entity =>
            {
                entity.Property(e => e.EmployeeId).HasColumnName("EmployeeID");

                entity.Property(e => e.BirthDate).HasColumnType("datetime");

                entity.Property(e => e.FirstName).IsRequired();

                entity.Property(e => e.HireDate).HasColumnType("datetime");

                entity.Property(e => e.Idcard)
                    .HasColumnName("IDCard")
                    .HasMaxLength(20);

                entity.Property(e => e.LastName).IsRequired();

                entity.Property(e => e.Phone1).HasMaxLength(50);

                entity.Property(e => e.Phone2).HasMaxLength(50);

                entity.Property(e => e.Photo).HasColumnType("image");

                entity.Property(e => e.PostalCode).HasMaxLength(7);

                entity.Property(e => e.Title).HasMaxLength(30);
            });

            modelBuilder.Entity<FutureShift>(entity =>
            {
                entity.HasKey(e => e.ShiftId);

                entity.Property(e => e.ShiftId)
                    .HasColumnName("ShiftID")
                    .ValueGeneratedNever();

                entity.Property(e => e.EmployeeId).HasColumnName("EmployeeID");

                entity.Property(e => e.Ended).HasColumnType("datetime");

                entity.Property(e => e.ShiftTypeId).HasColumnName("ShiftTypeID");

                entity.Property(e => e.Started).HasColumnType("datetime");

                entity.HasOne(d => d.Employee)
                    .WithMany(p => p.FutureShifts)
                    .HasForeignKey(d => d.EmployeeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_FutureShifts_Employees");

                entity.HasOne(d => d.Shift)
                    .WithOne(p => p.FutureShift)
                    .HasForeignKey<FutureShift>(d => d.ShiftId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_FutureShifts_ShiftTypes");
            });

            modelBuilder.Entity<PastShift>(entity =>
            {
                entity.HasKey(e => e.ShiftId);

                entity.Property(e => e.ShiftId).HasColumnName("ShiftID");

                entity.Property(e => e.EmployeeId).HasColumnName("EmployeeID");

                entity.Property(e => e.Ended).HasColumnType("datetime");

                entity.Property(e => e.ShiftTypeId).HasColumnName("ShiftTypeID");

                entity.Property(e => e.Started).HasColumnType("datetime");

                entity.HasOne(d => d.Employee)
                    .WithMany(p => p.PastShifts)
                    .HasForeignKey(d => d.EmployeeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PastShifts_Employees");

                entity.HasOne(d => d.ShiftType)
                    .WithMany(p => p.PastShifts)
                    .HasForeignKey(d => d.ShiftTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PastShifts_ShiftTypes");
            });

            modelBuilder.Entity<ShiftType>(entity =>
            {
                entity.Property(e => e.ShiftTypeId)
                    .HasColumnName("ShiftTypeID")
                    .ValueGeneratedNever();

                entity.Property(e => e.TypeTitle).HasMaxLength(15);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
