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
using WpfAppHellRaid.Pages.AboutStudents;

namespace WpfAppHellRaid.Components.UserControls
{
    /// <summary>
    /// Логика взаимодействия для StudentUserControl.xaml
    /// </summary>
    public partial class StudentUserControl : UserControl
    {
        private Student _student;
        private bool _canLookExtraInfo = false;
        public StudentUserControl(Student student)
        {
            InitializeComponent();
            _student = student;

            Stud_ID_TB.Text = $"Номер студента: {_student.ID}";
            Stud_ID_spec_TB.Text = $"Специальность: {_student.Speciality.Name_spec}" ;
            Stud_FIO_TB.Text = $"Инициалы студента: {_student.FIO}";
            PastStudPlace_TB.Text = $"{_student.AboutStudent.School.SchoolTitle.Title_name} №{_student.AboutStudent.School.SchoolNumber}";
            AverageSchoolMark_TB.Text = $"Балл атестата: {_student.AboutStudent.Average_Mark}";
           
            ExtrainfoSP.Visibility = _canLookExtraInfo == true ? Visibility.Visible : Visibility.Hidden;
        }

        private void Edit_BTN_Click(object sender, RoutedEventArgs e)
        {
            ModernNavigation.NextPage(new PageComponent("Редактирование сведений о студенте", new StudentEdit(_student)));
        }

        private void Remove_BTN_Click(object sender, RoutedEventArgs e)
        {
            _student.StudEnable = false;
            App.DataBase.SaveChanges();
            MessageBox.Show("Успешно удалено");
            ModernNavigation.NextPage(new PageComponent("Список студентов", new StudentList()));
        }

        private void EnableExtraInfo_BTN_Click(object sender, RoutedEventArgs e)
        {
            _canLookExtraInfo = _canLookExtraInfo == false ? true: false;
            ExtrainfoSP.Visibility = _canLookExtraInfo == true ? Visibility.Visible : Visibility.Hidden;
        }
    }
}
