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

namespace WpfAppHellRaid.Pages.AboutDiscipline
{
    /// <summary>
    /// Логика взаимодействия для DisciplaneEdit.xaml
    /// </summary>
    public partial class DisciplaneEdit : Page
    {
        StringBuilder errorString = new StringBuilder();
        private Discipline _discipline;
        public DisciplaneEdit(Discipline discipline)
        {
            InitializeComponent();
            this._discipline = discipline;

            this.DataContext = discipline;

            DepCB.ItemsSource = App.DataBase.Department.ToList();
            DepCB.DisplayMemberPath = "Dep_Name";

        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (DiscNameTB.Text == null || DiscNameTB.Text == "")
                errorString.AppendLine("");
            int.TryParse(VolTB.Text, out int volume);
            if (!(volume >= 50 && volume <= 500))
                errorString.AppendLine("Не корректные данные о объеме");
            if (DepCB.Text == "")
                errorString.AppendLine("Выберите кафедру");
            if (errorString.Length > 0)
            {
                MessageBox.Show(errorString.ToString());
                errorString.Clear();
            }
            else
            {
                if (_discipline.ID != 0)
                {
                    App.DataBase.SaveChanges();
                    ModernNavigation.NextPage(new PageComponent("Список дисциплин", new DisciplineList()));
                    MessageBox.Show("Данные изменены");
                }
                else
                {
                    App.DataBase.Discipline.Add(new Discipline()
                    {
                        DiscName = DiscNameTB.Text,
                        Volume = volume,
                        ID_dep = (DepCB.SelectedItem as Department).ID,
                        DiscEnable = true

                    }); ;
                    App.DataBase.SaveChanges();
                    ModernNavigation.NextPage(new PageComponent("Список дисциплин", new DisciplineList()));
                    MessageBox.Show("Данные сохранены");
                }

            }           
        }
        private void OnlyDigits_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            VolTB.MaxLength = 3;
            if (!Char.IsDigit(e.Text, 0))
                e.Handled = true;
        }
    }
}
