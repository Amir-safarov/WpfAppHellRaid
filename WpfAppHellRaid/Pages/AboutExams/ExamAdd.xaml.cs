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

namespace WpfAppHellRaid.Pages
{
    /// <summary>
    /// Логика взаимодействия для ExamAdd.xaml
    /// </summary>
    public partial class ExamAdd : Page
    {
        private Exasm _exam;
        private Student student;
        StringBuilder errorString = new StringBuilder();

        public ExamAdd(Exasm exam)
        {
            InitializeComponent();
            this._exam = exam;

            this.DataContext = exam;

            StudCB.ItemsSource = App.DataBase.Student.ToList();
            StudCB.DisplayMemberPath = "FIO";

            EmplCB.ItemsSource = App.DataBase.Employee.Where(x => x.EmplEnable == true && x.ID_jt ==1102 || x.ID_jt == 1101).ToList();
            EmplCB.DisplayMemberPath = "SFP";

            DisCB.ItemsSource = App.DataBase.Discipline.ToList();
            DisCB.DisplayMemberPath = "DiscName";

            AuditCB.ItemsSource = App.DataBase.Auditorium.ToList();
            AuditCB.DisplayMemberPath = "Audit_name";
        }

        public ExamAdd(Student student)
        {
            this.student = student;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (StudCB.SelectedItem == null)
                errorString.AppendLine("Выберите студента.");
            if (AuditCB.SelectedItem == null)
                errorString.AppendLine("Выберите аудиторию.");
            if (DisCB.SelectedItem == null)
                errorString.AppendLine("Выберите дисциплину.");
            if (EmplCB.SelectedItem == null)
                errorString.AppendLine("Выберите преподавателя.");
            if (DateExPicker.Text == "")
                errorString.AppendLine("Выберите дату проведения.");
            int.TryParse(MarkTB.Text, out int mark);
            if (!(mark >= 2 && mark <= 5))
                errorString.AppendLine("Не правильно введена оценка");
            if (errorString.Length != 0)
            {
                MessageBox.Show(errorString.ToString());
                errorString.Clear();
            }
            else
            {
                if (_exam.ID != 0)
                {
                    App.DataBase.SaveChanges();
                    ModernNavigation.NextPage(new PageComponent("Список экзаменов", new ExamsList()));
                    MessageBox.Show("Данные изменены");
                }
                else
                {
                    App.DataBase.Exasm.Add(new Exasm()
                    {
                        ID_dis = (DisCB.SelectedItem as Discipline).ID,
                        ID_empl = (EmplCB.SelectedItem as Employee).ID,
                        ID_stud = (StudCB.SelectedItem as Student).ID,
                        ID_audit = (AuditCB.SelectedItem as Auditorium).ID,
                        Mark = int.Parse(MarkTB.Text),
                        Date_ex = DateExPicker.SelectedDate,
                        ExamEnable = true
                    });
                    App.DataBase.SaveChanges();
                    ModernNavigation.NextPage(new PageComponent("Список экзаменов", new ExamsList()));
                    MessageBox.Show("Данные сохранены");
                }
            }
        }
        private void OnlyDigits_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            MarkTB.MaxLength = 1;
            if (!Char.IsDigit(e.Text, 0))
                e.Handled = true;
        }

       
    }
}
