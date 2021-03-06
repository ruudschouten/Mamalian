// <copyright file="ArmourTest.cs">Copyright ©  2017</copyright>
using System;
using MamalianLib;
using Microsoft.Pex.Framework;
using Microsoft.Pex.Framework.Validation;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace MamalianLib.Tests
{
    /// <summary>This class contains parameterized unit tests for Armour</summary>
    [PexClass(typeof(Armour))]
    [PexAllowedExceptionFromTypeUnderTest(typeof(InvalidOperationException))]
    [PexAllowedExceptionFromTypeUnderTest(typeof(ArgumentException), AcceptExceptionSubtypes = true)]
    [TestClass]
    public partial class ArmourTest
    {
        /// <summary>Test stub for .ctor(Int32, String, String, Int32, Int32, Int32)</summary>
        [PexMethod]
        public Armour ConstructorTest(
            int id,
            string name,
            string desc,
            int gold,
            int phys,
            int elem
        )
        {
            Armour target = new Armour(id, name, desc, gold, phys, elem);
            return target;
            // TODO: add assertions to method ArmourTest.ConstructorTest(Int32, String, String, Int32, Int32, Int32)
        }

        /// <summary>Test stub for ToString()</summary>
        [PexMethod]
        public string ToStringTest([PexAssumeUnderTest]Armour target)
        {
            string result = target.ToString();
            return result;
            // TODO: add assertions to method ArmourTest.ToStringTest(Armour)
        }
    }
}
