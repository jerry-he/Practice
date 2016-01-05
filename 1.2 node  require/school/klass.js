/**
 * Created by JerryHe on 1/2/16.
 */
 var student = require ('./student');
 var teacher = require('./teacher');
    teacher.add('jerryHe')
function add (teacherName,students){
    teacher.add(teacherName)
}students.forEach(function(item,index){
    student.add(item)
})
exports.add = add