const db = require('../data/db-config.js');

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove
};


function find() {
    return db("schemes");
}

async function findById(id) {
    const scheme = await db("schemes")
        .where({ id })
        .first()
    return scheme
}

async function findSteps(id) {
    const steps = await db('steps')
        .select('steps.id', 'steps.step_number', 'steps.instructions')
        .join('schemes', 'steps.scheme_id', 'schemes.id')
        .where({ scheme_id: id })
        .orderBy('steps.scheme_id')
    return steps;
}

function add(scheme) {
    return db('schemes').insert(scheme)
        .then(id => {
            return findById(id[0])
        })



}
function update(changes, id) {
    return db('schemes')
        .where({ id })
        .update(changes)
        .then(count => {
            return findById(id);
        })

}

function remove(id) {
    return db('schemes')
            .where({id})
            .del();
}
