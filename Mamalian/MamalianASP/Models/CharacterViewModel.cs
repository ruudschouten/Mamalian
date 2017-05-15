using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MamalianLib;

namespace MamalianASP.Models {
    public enum Class {
        Warrior,
        Elementalist
    }
    public class CharacterViewModel {
        public string Name { get; set; }
        public Gender Gender { get; set; }
        public Race Race { get; set; }
        public Class Class { get; set; }

        public int Strength { get; set; } 
        public int Dexterity { get; set; } 
        public int Intelligence { get; set; } 


        [Range(1, int.MaxValue, ErrorMessage = "Select a gender")]
        public Gender Genders { get; set; }

        [Range(1, int.MaxValue, ErrorMessage = "Select a race")]
        public Gender Races { get; set; }

        [Range(1, int.MaxValue, ErrorMessage = "Select a class")]
        public Class Classes { get; set; }
    }
}