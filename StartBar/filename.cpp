#include "filename.h"

FileName::FileName()
    : m_hasChild(false), m_count(0)
{
//    emit hasChildChanged();
}

FileName::~FileName()
{
    if(!m_listSubDir.empty()){
        for(QObject* i : m_listSubDir){
            if(i != nullptr){
                delete i;
                i = nullptr;
            }
        }
        m_listSubDir.clear();
    }
}

const QString &FileName::filename() const
{
    return m_filename;
}

void FileName::setFilename(const QString &newFilename)
{
    if (m_filename == newFilename)
        return;
    m_filename = newFilename;
    emit filenameChanged();
}

const QList<QObject *> &FileName::listSubDir() const
{
    return m_listSubDir;
}

void FileName::addSubDir(QObject *subDir)
{
    m_listSubDir.append(subDir);
    m_hasChild = true;
    m_count ++;
    emit hasChildChanged();
    emit countChanged();
}

void FileName::setListSubDir(const QList<QObject *> &newListSubDir)
{
    if (m_listSubDir == newListSubDir)
        return;
    m_listSubDir = newListSubDir;
    emit listSubDirChanged();
}

bool FileName::isDir() const
{
    return m_isDir;
}

void FileName::setIsDir(bool newIsDir)
{
    if (m_isDir == newIsDir)
        return;
    m_isDir = newIsDir;
    emit isDirChanged();
}

bool FileName::hasChild() const
{
    return m_hasChild;
}

void FileName::setHasChild(bool newHasChild)
{
    if (m_hasChild == newHasChild)
        return;
    m_hasChild = newHasChild;
    emit hasChildChanged();
}

int FileName::count() const
{
    return m_count;
}

void FileName::setCount(int newCount)
{
    if (m_count == newCount)
        return;
    m_count = newCount;
    emit countChanged();
}
