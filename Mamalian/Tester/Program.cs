using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MamalianDAL.Logic;
using MamalianLib;

namespace Tester {
    class Program {
        static void Main(string[] args) {
            bool cont = true;
            Console.WriteLine("What would you like to do?");
            PrintOptions();
            Console.Write("> ");
            while (cont) {
                string query = Console.ReadLine();
                switch (query.ToLower()) {
                    case "1":
                    case "2":
                    case "3":
                    case "4":
                    case "5":
                    case "6":
                    case "7":
                        PrintOperations();
                        Action(query.ToLower());
                        break;
                    case "h":
                        PrintOptions();
                        break;
                    case "q":
                        cont = false;
                        break;
                    default:
                        Console.WriteLine("Unknown command.");
                        break;
                }
                Console.Write("> ");
            }
            Console.WriteLine("Thanks for playing");
            Console.ReadLine();
        }

        private static void Action(string option) {
            var selection = Console.ReadLine();
            switch (selection.ToLower()) {
                case "1":
                    int id = GetSingleId();
                    switch (option.ToLower()) {
                        case "1":
                            Player p = new PlayerSQLContext().GetById(id);
                            Console.WriteLine(p);
                            break;
                        case "2":
                            Team t = new TeamSQLContext().GetById(id);
                            Console.WriteLine(t);
                            break;
                        case "3":
                            Class c = new ClassSQLContext().GetById(id);
                            Console.WriteLine(c);
                            break;
                        case "4":
                            Stats s = new StatsSQLContext().GetById(id);
                            Console.WriteLine(s);
                            break;
                        case "5":
                            try {
                                Weapon w = new WeaponSQLContext().GetById(id);
                                Console.WriteLine(w);
                            }
                            catch (Exception) {
                            }
                            try {
                                Armour a = new ArmourSQLContext().GetById(id);
                                Console.WriteLine(a);
                            }
                            catch (Exception) {
                            }
                            try {
                                Potion po = new PotionSQLContext().GetById(id);
                                Console.WriteLine(po);
                            }
                            catch (Exception) {
                            }
                            break;
                        case "6":
                            PowerUp pow = new PowerUpSQLContext().GetById(id);
                            Console.WriteLine(pow);
                            break;
                        case "7":
                            Wave wav = new WaveSQLContext().GetById(id);
                            Console.WriteLine(wav);
                            break;
                    }
                    break;
                case "2":
                    switch (option.ToLower()) {
                        case "1":
                            foreach (Player p in new PlayerSQLContext().GetAll()) {
                                Console.WriteLine(p);
                                Console.WriteLine("\nPress enter to see next Player");
                                Console.ReadLine();
                                Console.Clear();
                            }
                            break;
                        case "2":
                            foreach (Team p in new TeamSQLContext().GetAll()) {
                                Console.WriteLine(p);
                                Console.WriteLine("\nPress enter to see next Team");
                                Console.ReadLine();
                                Console.Clear();
                            }
                            break;
                        case "3":
                            foreach (Class p in new ClassSQLContext().GetAll()) {
                                Console.WriteLine(p);
                                Console.WriteLine("\nPress enter to see next Class");
                                Console.ReadLine();
                                Console.Clear();
                            }
                            break;
                        case "4":
                            foreach (Stats p in new StatsSQLContext().GetAll()) {
                                Console.WriteLine(p);
                                Console.WriteLine("\nPress enter to see next Stats");
                                Console.ReadLine();
                                Console.Clear();
                            }
                            break;
                        case "5":
                            try {
                                foreach (Weapon p in new WeaponSQLContext().GetAll()) {
                                    Console.WriteLine(p);
                                    Console.WriteLine("\nPress enter to see next Weapon");
                                    Console.ReadLine();
                                    Console.Clear();
                                }
                            }
                            catch (Exception) {
                            }
                            try {
                                foreach (Armour p in new ArmourSQLContext().GetAll()) {
                                    Console.WriteLine(p);
                                    Console.WriteLine("\nPress enter to see next Armour");
                                    Console.ReadLine();
                                    Console.Clear();
                                }
                            }
                            catch (Exception) {
                            }
                            try {
                                foreach (Potion p in new PotionSQLContext().GetAll()) {
                                    Console.WriteLine(p);
                                    Console.WriteLine("\nPress enter to see next Potion");
                                    Console.ReadLine();
                                    Console.Clear();
                                }
                            }
                            catch (Exception) {
                            }
                            break;
                        case "6":
                            foreach (PowerUp p in new PowerUpSQLContext().GetAll()) {
                                Console.WriteLine(p);
                                Console.WriteLine("\nPress enter to see next PowerUp");
                                Console.ReadLine();
                                Console.Clear();
                            }
                            break;
                        case "7":
                            Console.WriteLine("Unable to get all waves, it'll freeze the program");
                            break;
                    }
                    break;
                default:
                    Console.WriteLine("Unknown command");
                    break;
            }
            Console.WriteLine("\nPress enter to continue");
            Console.ReadLine();
            Console.Clear();
            PrintOptions();
        }

        public static void PrintOptions() {
            Console.WriteLine("1. Player:  \t Player SQL Functions");
            Console.WriteLine("2. Team:    \t Team SQL Functions");
            Console.WriteLine("3. Class:   \t Class SQL Functions");
            Console.WriteLine("4. Stats:   \t Stats SQL Functions");
            Console.WriteLine("5. Item:    \t Item SQL Functions");
            Console.WriteLine("6. PowerUps:\t PowerUp SQL Functions");
            Console.WriteLine("7. Wave:    \t Wave SQL Functions");
            Console.WriteLine("__________");
            Console.WriteLine("H. Help:    \t Show this menu");
            Console.WriteLine("Q. Quit:    \t Quit");
        }

        private static void PrintOperations() {
            Console.Clear();
            Console.WriteLine("1. Single:  \tShow single player");
            Console.WriteLine("2. All:     \tShow all players");
        }

        private static int GetSingleId() {
            Console.Clear();
            Console.WriteLine("Enter an Id");
            return Convert.ToInt32(Console.ReadLine());
        }
    }
}