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
            SpecCB.ItemsSource = App.DataBase.Speciality.ToList();
            SpecCB.DisplayMemberPath = "Name_spec";
            SchoolTitleCB.ItemsSource = App.DataBase.SchoolTitle.ToList();
            SchoolTitleCB.DisplayMemberPath = "Title_name";
            MarkTB.Text = "3.00";
            
        }
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errorString = new StringBuilder();
            if (SpecCB.SelectedItem == null || SpecCB.SelectedIndex == -1)
                errorString.AppendLine("Выберите дисциплину");
            if (FIOStudTB.Text == null || FIOStudTB.Text == "")
                errorString.AppendLine("Введите инициалы студента");
            if (SchoolTitleCB.SelectedIndex == -1 || SchoolTitleCB.SelectedItem == null)
                errorString.AppendLine("Введите тип школы, где учился студент");
            if (double.Parse(MarkTB.Text.Replace(".", ",")) > 5.00 || double.Parse(MarkTB.Text.Replace(".", ",")) < 2.00 || MarkTB.Text == "" || MarkTB.Text == null)
                errorString.AppendLine("Введите корректный балл атестата");
            if (SchoolNumberTB.Text == null || SchoolNumberTB.Text == "")
                errorString.AppendLine("Введите номер школы, где учился студент");

            if (errorString.Length > 0)
                MessageBox.Show(errorString.ToString());
            else
            {
                if (_student.ID != 0)
                {
                    App.DataBase.SaveChanges();
                    MessageBox.Show("Данные сохранены");
                }
                else
                {
                    //_student.ID_spec = SpecCB.SelectedIndex; 
                    //_student.FIO = FIOStudTB.Text;
                    //_student.AboutStudent.School.SchoolTitle.ID = SchoolTitleCB.SelectedIndex;
                    //_student.AboutStudent.Average_Mark = double.Parse(MarkTB.Text.Replace(".", ","));
                    //_student.StudEnable = true;
                    App.DataBase.School.Add(new School()
                    {
                        SchoolNumber = int.Parse(SchoolNumberTB.Text),
                        ID_scholl_title = (SchoolTitleCB.SelectedItem as SchoolTitle).ID
                    });
                    App.DataBase.SaveChanges();
                    var lastScholId = App.DataBase.AboutStudent.OrderByDescending(x => x.ID_school).FirstOrDefault().ID_school;
                    App.DataBase.AboutStudent.Add(new AboutStudent()
                    {
                        Average_Mark = double.Parse(MarkTB.Text.Replace(".", ",")),
                        ID_school = lastScholId 
                    });
                    App.DataBase.SaveChanges();
                    var lastinfoId = App.DataBase.Student.OrderByDescending(x => x.ID_info).FirstOrDefault().ID_info;
                    App.DataBase.Student.Add(new Student()
                    {
                        ID_info = lastinfoId,
                        FIO = FIOStudTB.Text,
                        ID_spec = (SpecCB.SelectedItem as Speciality).ID,
                        StudEnable = true,
                    });
                    App.DataBase.SaveChanges();
                    MessageBox.Show("Данные сохранены");
                    ModernNavigation.BackPage();
                }
            }
        }
        private void OnlyDigits_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!Char.IsDigit(e.Text, 0))
                e.Handled = true;
        }
    }
}
