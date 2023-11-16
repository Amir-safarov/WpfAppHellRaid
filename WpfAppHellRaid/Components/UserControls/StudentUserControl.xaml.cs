using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace WpfAppHellRaid.Components.UserControls
{
    /// <summary>
    /// Логика взаимодействия для StudentUserControl.xaml
    /// </summary>
    public partial class StudentUserControl : UserControl
    {
        private Student _student;
        public StudentUserControl(Student student)
        {
            InitializeComponent();
            _student = student;

            Stud_ID_TB.Text = $"Номер студента: {_student.ID}";
            Stud_ID_spec_TB.Text = $"Специальность: {_student.Speciality.Name_spec}" ;
            Stud_FIO_TB.Text = $"Инициалы студента: {_student.FIO}";
            PastStudPlace_TB.Text = $"{_student.AboutStudent.School.SchoolTitle.Title_name} №{_student.AboutStudent.School.SchoolNumber}";
            AverageSchoolMark_TB.Text = $"Балл атестата: {_student.AboutStudent.Average_Mark}";
        }
    }
}
