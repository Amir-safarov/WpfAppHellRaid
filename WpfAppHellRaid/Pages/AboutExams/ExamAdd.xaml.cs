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
        private Exasm exam;
        public ExamAdd(Exasm exam)
        {
            this.exam = exam;

            this.DataContext = exam;

            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            exam.ID = int.Parse(IDExTB.Text);
            exam.ID_empl = int.Parse(IDEmplTB.Text);
            exam.ID_dis = int.Parse(IDDisTB.Text);
            exam.ID_stud = int.Parse(IDStudTB.Text);
            exam.Audit = AuditTB.Text;
            exam.Date_ex = DateTime.Parse(DateExPicker.Text);
            exam.Mark = int.Parse(MarkTB.Text);
            exam.ExamEnable = true;
            App.DataBase.Exasm.Add(exam);
            App.DataBase.SaveChanges();
            MessageBox.Show("Yzbek");
            ModernNavigation.NextPage(new PageComponent("Список экзаменов", new ExamsList()));

        }
        private void OnlyDigits_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!Char.IsDigit(e.Text, 0))
                e.Handled = true;
        }
    }
}
