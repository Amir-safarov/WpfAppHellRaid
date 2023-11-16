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
using WpfAppHellRaid.Components;

namespace WpfAppHellRaid.Pages.AboutStudents
{
    /// <summary>
    /// Логика взаимодействия для StudentEdit.xaml
    /// </summary>
    public partial class StudentEdit : Page
    {
        private Student _student;
        public StudentEdit(Student student)
        {
            this._student = student;
            this.DataContext = student;
            InitializeComponent();
        }
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (IDStudTB.Text != null & IDStudTB.Text != "" & _student.ID !=0)
            {    
                _student.ID_spec = 101 + SpecCB.SelectedIndex;
                _student.FIO = FIOStudTB.Text;
                _student.AboutStudent.School.SchoolTitle.ID = 551 + SchoolTitleCB.SelectedIndex;
                _student.AboutStudent.Average_Mark = double.Parse(MarkTB.Text.Replace(".", ","));
                _student.StudEnable = true;
                MessageBox.Show("Yzbek");
                ModernNavigation.NextPage(new PageComponent("Список студентов", new ExamsList()));
            }
            if(_student.ID ==0 & IDStudTB.Text != "")
            { 
                _student.ID = int.Parse(IDStudTB.Text);
                App.DataBase.Student.Add(_student);
                App.DataBase.SaveChanges();
            }
            else 
                MessageBox.Show("У студента должен быть уникальный номер");
        }
        private void OnlyDigits_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!Char.IsDigit(e.Text, 0))
                e.Handled = true;
        }
    }
}
