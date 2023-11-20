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
using WpfAppHellRaid.Pages;
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
            if (App.isEmployee == false)
            {
                Edit_BTN.Visibility = Visibility.Collapsed;
                Remove_BTN.Visibility = Visibility.Collapsed;
            }
            _student = student;

            Stud_ID_TB.Text = $"Номер студента: {_student.ID}";
            if (_student.Speciality.Name_spec == null)
                Stud_ID_spec_TB.Text = $"Специальность: Неизвестно";
            else
                Stud_ID_spec_TB.Text = $"Специальность: {_student.Speciality.Name_spec}";

            if (_student.FIO == null)
                Stud_ID_spec_TB.Text = $"Инициалы: Неизвестно";
            else
                Stud_FIO_TB.Text = $"Инициалы: {_student.FIO}";

            if (_student.AboutStudent == null)
                PastStudPlace_TB.Text = $"Неизвсестное учебное заведение";
            else
                PastStudPlace_TB.Text = $"{_student.AboutStudent.School.SchoolTitle.Title_name} №{_student.AboutStudent.School.SchoolNumber}";

            if (_student.AboutStudent == null)
                AverageSchoolMark_TB.Text = $"Балл атестата: Неизвестно";
            else
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
        }

        private void EnableExtraInfo_BTN_Click(object sender, RoutedEventArgs e)
        {
            _canLookExtraInfo = _canLookExtraInfo == false ? true : false;
            ExtrainfoSP.Visibility = _canLookExtraInfo == true ? Visibility.Visible : Visibility.Hidden;
        }
    }
}
